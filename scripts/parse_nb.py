"""
parse_nb.py — Parse a Wolfram .nb file and emit a Hugo-flavoured Markdown page.

Usage:
    python parse_nb.py <input.nb> <output.md> [--images-dir images/partXX]

The script:
  - Extracts text cells → Markdown
  - Converts BoxData math → KaTeX-compatible LaTeX  ($…$ or $$…$$)
  - Hides Input cells entirely
  - Inserts image placeholders for Output / graphics cells
  - Skips blank Text cells
"""

from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path

# Allow running from any directory
sys.path.insert(0, str(Path(__file__).parent))
from boxes_to_latex import box_to_latex, replace_wolfram_chars

# ── Tokeniser ────────────────────────────────────────────────────────────────

# Tokens: STRING, IDENT, LBRACKET, RBRACKET, LBRACE, RBRACE, COMMA, OTHER

_TOKEN_RE = re.compile(
    r'"(?:[^"\\]|\\[\s\S])*"'  # quoted string (\\[\s\S] matches \+any char incl. newline)
    r'|[A-Za-z$][A-Za-z0-9$`]*'  # identifier / symbol
    r'|[0-9]+(?:\.[0-9]*)?(?:`[0-9.]*)?(?:\*\^-?[0-9]+)?'  # number
    r'|[,\[\]{}]'           # punctuation
    r'|->|:>'               # rule arrows
    r'|[^\s,\[\]{}]'        # any other single char
)


def tokenise(src: str) -> list[str]:
    return _TOKEN_RE.findall(src)


# ── Parser ───────────────────────────────────────────────────────────────────

class Parser:
    def __init__(self, tokens: list[str]):
        self.tokens = tokens
        self.pos = 0

    def peek(self) -> str | None:
        return self.tokens[self.pos] if self.pos < len(self.tokens) else None

    def consume(self) -> str:
        t = self.tokens[self.pos]
        self.pos += 1
        return t

    def expect(self, tok: str):
        t = self.consume()
        if t != tok:
            raise ValueError(f"Expected {tok!r}, got {t!r} at pos {self.pos}")

    def parse_expr(self):
        """Parse one Mathematica expression."""
        tok = self.peek()
        if tok is None:
            return None

        # String literal
        if tok.startswith('"'):
            self.consume()
            return unescape_mma_string(tok[1:-1])

        # Number
        if tok and (tok[0].isdigit() or (tok[0] == '-' and len(tok) > 1)):
            self.consume()
            return tok

        # Identifier — could be a function call Head[...]
        if tok and (tok[0].isalpha() or tok[0] == '$'):
            self.consume()
            head = tok
            if self.peek() == '[':
                self.expect('[')
                args = []
                while self.peek() not in (']', None):
                    args.append(self.parse_expr())
                    if self.peek() == ',':
                        self.consume()
                self.expect(']')
                return [head] + args
            return head

        # List {a, b, c}
        if tok == '{':
            self.consume()
            items = []
            while self.peek() not in ('}', None):
                items.append(self.parse_expr())
                if self.peek() == ',':
                    self.consume()
            if self.peek() == '}':
                self.consume()
            return items

        # Rule  a -> b  or  a :> b
        # (already consumed lhs at this point — handled inline)

        # Skip unknown tokens
        self.consume()
        return tok

    def parse_top(self):
        """Parse all top-level expressions from the token stream."""
        results = []
        while self.pos < len(self.tokens):
            e = self.parse_expr()
            if e is not None:
                results.append(e)
        return results


def unescape_mma_string(s: str) -> str:
    """Unescape Mathematica string internals and clean up line continuations."""
    # Wolfram continuation: backslash-newline inside strings → single space
    s = re.sub(r'\\\n\s*', ' ', s)
    # \< … \> is Mathematica's raw string indicator — strip them
    s = re.sub(r'\\[<>]', '', s)
    # Standard Mathematica string escapes
    s = s.replace('\\"', '"')
    s = s.replace('\\n', '\n')   # newline
    s = s.replace('\\t', '    ') # tab → 4 spaces for prose
    s = s.replace('\\\\', '\\')
    return s


def clean_text_whitespace(s: str) -> str:
    """Collapse runs of whitespace in plain prose (not math)."""
    s = re.sub(r'[ \t]+', ' ', s)
    s = re.sub(r'\n{3,}', '\n\n', s)
    return s.strip()


# ── Notebook cell extraction ─────────────────────────────────────────────────

def is_graphics_output(cell_content) -> bool:
    """True if the cell content is a graphics object (not displayable as text)."""
    if isinstance(cell_content, list):
        head = cell_content[0] if cell_content else ""
        if head in ("GraphicsBox", "Graphics3DBox", "RasterBox",
                    "DynamicBox", "DynamicModuleBox",
                    "TagBox",    # often wraps graphics
                    "LocatorPaneBox", "PanelBox"):
            return True
        # TagBox wrapping graphics
        if head == "TagBox" and len(cell_content) > 1:
            return is_graphics_output(cell_content[1])
    return False


def boxdata_to_latex(bd) -> str:
    """Convert a BoxData node to LaTeX string."""
    if isinstance(bd, list) and bd and bd[0] == "BoxData":
        inner = bd[1] if len(bd) > 1 else bd
    else:
        inner = bd
    return box_to_latex(inner)


# ── Text content extraction ──────────────────────────────────────────────────

def textdata_to_md(items) -> str:
    """Convert a TextData list to Markdown text (with inline math)."""
    parts = []
    if not isinstance(items, list):
        return replace_wolfram_chars(str(items))

    for item in items:
        if isinstance(item, str):
            parts.append(replace_wolfram_chars(item))
        elif isinstance(item, list):
            head = item[0] if item else ""
            if head == "Cell":
                # Inline Cell — usually BoxData math
                parts.append(inline_cell_to_md(item))
            elif head == "StyleBox":
                inner_text = textdata_to_md(item[1:2])
                # Check for font options
                opts = item[2:] if len(item) > 2 else []
                bold = any(
                    (isinstance(o, list) and o == ["Rule", "FontWeight", "Bold"])
                    or o == "Bold"
                    for o in opts
                )
                italic = any(
                    (isinstance(o, list) and o == ["Rule", "FontSlant", "Italic"])
                    or o == "Italic"
                    for o in opts
                )
                if bold:
                    inner_text = f"**{inner_text.strip()}**"
                elif italic:
                    inner_text = f"*{inner_text.strip()}*"
                parts.append(inner_text)
            elif head == "ButtonBox":
                parts.append(textdata_to_md(item[1:2]))
            else:
                # Unknown — try to extract string content recursively
                parts.append(textdata_to_md(item[1:]))
        else:
            parts.append(str(item))

    return "".join(parts)


def inline_cell_to_md(cell_node: list) -> str:
    """Convert an inline Cell[BoxData[...], ...] to $...$."""
    # cell_node = ["Cell", content, cell_type, ...]
    if len(cell_node) < 2:
        return ""
    content = cell_node[1]
    if isinstance(content, list) and content and content[0] == "BoxData":
        latex = boxdata_to_latex(content)
        return f"${latex}$"
    return ""


def plain_string_to_md(s: str) -> str:
    """Convert a plain Mathematica string cell content to Markdown."""
    return replace_wolfram_chars(s)


# ── Main cell dispatcher ─────────────────────────────────────────────────────

def cell_to_md(cell: list, image_counter: list[int], images_dir: str) -> str | None:
    """
    Convert a parsed Cell[...] node to a Markdown string.
    Returns None if the cell should be skipped.

    cell = ["Cell", content, cell_type, ...options...]
    """
    if not isinstance(cell, list) or cell[0] != "Cell" or len(cell) < 2:
        return None

    content   = cell[1]
    cell_type = cell[2] if len(cell) > 2 else ""

    # ── Skip code, navigation, and metadata cells ───────────────────────────
    if cell_type in ("Input", "Code", "Print", "Message"):
        return None
    # Skip button/hyperlink cells (navigation widgets at notebook bottom)
    if isinstance(content, list) and content and content[0] in ("ButtonBox", "TemplateBox"):
        return None

    # ── CellGroupData — handled by walk_cells, skip here ───────────────────
    if isinstance(content, list) and content and content[0] == "CellGroupData":
        return None

    # ── Output cells with graphics ──────────────────────────────────────────
    if cell_type == "Output":
        inner = content
        if isinstance(inner, list) and inner and inner[0] == "BoxData":
            inner = inner[1] if len(inner) > 1 else inner
        if is_graphics_output(inner):
            image_counter[0] += 1
            n = image_counter[0]
            img_path = f"{images_dir}/output_{n:03d}.png"
            return f'![Figure {n}]({img_path})'
        # Non-graphics output (e.g. a computed number) — skip
        return None

    # ── Headings ────────────────────────────────────────────────────────────
    if cell_type == "Title":
        text = clean_text_whitespace(extract_text(content))
        return f"# {text}" if text else None

    if cell_type == "Section":
        text = clean_text_whitespace(extract_text(content))
        # Skip author/contact info sections
        if text and ("@" in text or "University of Cape Town" in text):
            return None
        return f"## {text}" if text else None

    if cell_type == "Subsection":
        text = clean_text_whitespace(extract_text(content))
        return f"### {text}" if text else None

    if cell_type == "Subsubsection":
        text = clean_text_whitespace(extract_text(content))
        return f"#### {text}" if text else None

    # ── Display math ────────────────────────────────────────────────────────
    if cell_type in ("DisplayFormula", "DisplayFormulaNumbered",
                     "Equation", "EquationNumbered"):
        latex = extract_display_math(content)
        if latex and latex.strip():
            return f"$$\n{latex.strip()}\n$$"
        return None

    # ── List items ──────────────────────────────────────────────────────────
    if cell_type in ("Item", "ItemParagraph"):
        text = extract_text(content)
        return f"- {text}" if text else None

    if cell_type in ("ItemNumbered",):
        text = extract_text(content)
        return f"1. {text}" if text else None

    # ── Text cells ──────────────────────────────────────────────────────────
    if cell_type in ("Text", "Subsubsubsection", ""):
        # Skip navigation-button-only cells (TextData[ButtonBox[...]])
        if (isinstance(content, list) and content and content[0] == "TextData"
                and len(content) > 1
                and isinstance(content[1], list) and content[1]
                and content[1][0] == "ButtonBox"):
            return None
        text = clean_text_whitespace(extract_text(content))
        if not text:
            return None  # skip blank text cells
        return text

    # ── Inline math inside Text as BoxData ──────────────────────────────────
    if cell_type in ("InlineFormula",):
        latex = extract_display_math(content)
        return f"${latex}$" if latex else None

    # ── Anything else — skip ────────────────────────────────────────────────
    return None


def extract_text(content) -> str:
    """Extract human-readable text from a cell's content node."""
    if isinstance(content, str):
        return plain_string_to_md(content)

    if isinstance(content, list):
        head = content[0] if content else ""

        if head == "TextData":
            inner = content[1] if len(content) > 1 else []
            if isinstance(inner, list) and inner:
                first = inner[0]
                # If the first element is a Wolfram head (uppercase, no spaces),
                # then `inner` is a single expression like StyleBox[...], not a list of items.
                if isinstance(first, str) and first[:1].isupper() and " " not in first:
                    return extract_text(inner)
                return textdata_to_md(inner)
            return replace_wolfram_chars(str(inner))

        if head == "StyleBox":
            return extract_text(content[1]) if len(content) > 1 else ""

        if head == "BoxData":
            return boxdata_to_latex(content)

        if head == "FormBox":
            return box_to_latex(content)

        # Fallback — join string children
        return "".join(
            extract_text(c) for c in content[1:]
            if not isinstance(c, list) or (c and c[0] not in ("Rule", "RuleDelayed"))
        )

    return ""


def extract_display_math(content) -> str:
    """Extract LaTeX from a display-math cell."""
    if isinstance(content, list):
        head = content[0] if content else ""
        if head == "BoxData":
            return boxdata_to_latex(content)
        if head == "FormBox":
            return box_to_latex(content)
        if head == "RowBox":
            return box_to_latex(content)
        # Try first child
        if len(content) > 1:
            return extract_display_math(content[1])
    return ""


# ── Top-level notebook walker ────────────────────────────────────────────────

def walk_cells(cell_list: list, blocks: list, image_counter: list, images_dir: str):
    """Recursively walk a list of Cell nodes, appending Markdown blocks."""
    for node in cell_list:
        if not isinstance(node, list) or not node:
            continue
        if node[0] != "Cell":
            continue

        content  = node[1] if len(node) > 1 else None
        cell_type = node[2] if len(node) > 2 else ""

        # CellGroupData — recurse into children
        if isinstance(content, list) and content and content[0] == "CellGroupData":
            inner = content[1]
            if isinstance(inner, list):
                walk_cells(inner, blocks, image_counter, images_dir)
            continue

        # Leaf cell — convert to Markdown
        md = cell_to_md(node, image_counter, images_dir)
        if md and md.strip():
            blocks.append(md)


def walk_notebook(nb: list, images_dir: str) -> list[str]:
    """Walk a parsed Notebook[{...}] expression and return Markdown blocks."""
    if not isinstance(nb, list) or nb[0] != "Notebook":
        raise ValueError("Not a Notebook expression")

    cells_list = nb[1]  # The list of cells ({...} first arg)
    if not isinstance(cells_list, list):
        return []

    blocks: list[str] = []
    image_counter = [0]
    walk_cells(cells_list, blocks, image_counter, images_dir)
    return blocks


# ── File reading with line-continuation handling ─────────────────────────────

def read_nb_source(path: Path) -> str:
    """Read a .nb file, stripping the header comment block."""
    src = path.read_text(encoding="utf-8", errors="replace")
    # Strip the (* ... *) header
    src = re.sub(r'^\(\*.*?\*\)\n', '', src, flags=re.DOTALL)
    # Remove (* Content-type ... *) lines
    src = re.sub(r'\(\*[^*]*\*\)', '', src)
    # Normalise Wolfram's \r\n
    src = src.replace('\r\n', '\n').replace('\r', '\n')
    return src


# ── Frontmatter generation ────────────────────────────────────────────────────

def make_frontmatter(title: str, weight: int) -> str:
    safe_title = title.replace('"', '\\"')
    return f"""---
title: "{safe_title}"
weight: {weight}
math: true
---
"""


# ── CLI entry point ───────────────────────────────────────────────────────────

def main():
    ap = argparse.ArgumentParser(description="Convert a .nb file to Hugo Markdown.")
    ap.add_argument("input",  type=Path, help="Input .nb file")
    ap.add_argument("output", type=Path, help="Output .md file")
    ap.add_argument("--images-dir", default="", help="Relative image path prefix for this page")
    ap.add_argument("--weight", type=int, default=10, help="Hugo page weight (ordering)")
    args = ap.parse_args()

    print(f"Parsing {args.input} …", file=sys.stderr)
    src = read_nb_source(args.input)
    tokens = tokenise(src)
    print(f"  {len(tokens)} tokens", file=sys.stderr)

    parser = Parser(tokens)
    exprs = parser.parse_top()

    # Find the Notebook[...] expression
    nb = next((e for e in exprs if isinstance(e, list) and e and e[0] == "Notebook"), None)
    if nb is None:
        print("ERROR: No Notebook expression found", file=sys.stderr)
        sys.exit(1)

    images_dir = args.images_dir or f"images/{args.input.stem}"
    blocks = walk_notebook(nb, images_dir)

    # Extract title from the first heading block (first line only)
    title = "Untitled"
    for b in blocks:
        if b.startswith("# "):
            title = b[2:].split("\n")[0].strip()
            break

    md = make_frontmatter(title, args.weight)
    md += "\n".join(blocks)

    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(md, encoding="utf-8")
    print(f"  Written {args.output}  ({len(blocks)} blocks)", file=sys.stderr)


if __name__ == "__main__":
    main()
