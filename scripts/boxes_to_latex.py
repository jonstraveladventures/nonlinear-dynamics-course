"""
boxes_to_latex.py — Convert Wolfram BoxData expressions to LaTeX.

Handles the recursive box tree produced by Mathematica's TraditionalForm
typesetting. Called by parse_nb.py.
"""

import re
import warnings

# ── Wolfram special-character maps ──────────────────────────────────────────

# Characters that appear in math contexts → LaTeX commands
MATH_CHARS: dict[str, str] = {
    "Alpha": r"\Alpha", "Beta": r"\Beta", "Gamma": r"\Gamma",
    "Delta": r"\Delta", "Epsilon": r"\Epsilon", "Zeta": r"\Zeta",
    "Eta": r"\Eta", "Theta": r"\Theta", "Iota": r"\Iota",
    "Kappa": r"\Kappa", "Lambda": r"\Lambda", "Mu": r"\Mu",
    "Nu": r"\Nu", "Xi": r"\Xi", "Pi": r"\Pi", "Rho": r"\Rho",
    "Sigma": r"\Sigma", "Tau": r"\Tau", "Upsilon": r"\Upsilon",
    "Phi": r"\Phi", "Chi": r"\Chi", "Psi": r"\Psi", "Omega": r"\Omega",
    "alpha": r"\alpha", "beta": r"\beta", "gamma": r"\gamma",
    "delta": r"\delta", "epsilon": r"\epsilon", "zeta": r"\zeta",
    "eta": r"\eta", "theta": r"\theta", "iota": r"\iota",
    "kappa": r"\kappa", "lambda": r"\lambda", "mu": r"\mu",
    "nu": r"\nu", "xi": r"\xi", "pi": r"\pi", "rho": r"\rho",
    "sigma": r"\sigma", "tau": r"\tau", "upsilon": r"\upsilon",
    "phi": r"\phi", "chi": r"\chi", "psi": r"\psi", "omega": r"\omega",
    "Infinity": r"\infty",
    "PlusMinus": r"\pm", "MinusPlus": r"\mp",
    "Times": r"\times", "Divide": r"\div",
    "Equal": "=", "NotEqual": r"\neq",
    "LessEqual": r"\leq", "GreaterEqual": r"\geq",
    "Element": r"\in", "NotElement": r"\notin",
    "Subset": r"\subset", "SuperSet": r"\supset",
    "Union": r"\cup", "Intersection": r"\cap",
    "ForAll": r"\forall", "Exists": r"\exists",
    "Implies": r"\Rightarrow", "Equivalent": r"\Leftrightarrow",
    "And": r"\land", "Or": r"\lor", "Not": r"\lnot",
    "PartialD": r"\partial",
    "Integral": r"\int", "Sum": r"\sum", "Product": r"\prod",
    "Sqrt": r"\sqrt",
    "DotlessI": r"\imath", "DotlessJ": r"\jmath",
    "DoubleStruckCapitalR": r"\mathbb{R}",
    "DoubleStruckCapitalC": r"\mathbb{C}",
    "DoubleStruckCapitalZ": r"\mathbb{Z}",
    "DoubleStruckCapitalN": r"\mathbb{N}",
    "DoubleStruckCapitalQ": r"\mathbb{Q}",
    "RightArrow": r"\rightarrow", "LeftArrow": r"\leftarrow",
    "UpArrow": r"\uparrow", "DownArrow": r"\downarrow",
    "LeftRightArrow": r"\leftrightarrow",
    "Rule": r"\to", "RuleDelayed": r"\mapsto",
    "FilledSmallCircle": r"\bullet",
    "FilledCircle": r"\bullet",
    "EmptyCircle": r"\circ",
    "VerticalSeparator": r"|",
    "Ellipsis": r"\ldots",
    "CapitalDifferentialD": r"\mathrm{d}",
    "DifferentialD": r"\mathrm{d}",
    "ExponentialE": r"\mathrm{e}",
    "ImaginaryI": r"\mathrm{i}",
}

# Characters that appear in text contexts → Unicode
TEXT_CHARS: dict[str, str] = {
    "Alpha": "Α", "Beta": "Β", "Gamma": "Γ", "Delta": "Δ",
    "Epsilon": "Ε", "Zeta": "Ζ", "Eta": "Η", "Theta": "Θ",
    "Iota": "Ι", "Kappa": "Κ", "Lambda": "Λ", "Mu": "Μ",
    "Nu": "Ν", "Xi": "Ξ", "Pi": "Π", "Rho": "Ρ",
    "Sigma": "Σ", "Tau": "Τ", "Upsilon": "Υ", "Phi": "Φ",
    "Chi": "Χ", "Psi": "Ψ", "Omega": "Ω",
    "alpha": "α", "beta": "β", "gamma": "γ", "delta": "δ",
    "epsilon": "ε", "zeta": "ζ", "eta": "η", "theta": "θ",
    "iota": "ι", "kappa": "κ", "lambda": "λ", "mu": "μ",
    "nu": "ν", "xi": "ξ", "pi": "π", "rho": "ρ",
    "sigma": "σ", "tau": "τ", "upsilon": "υ", "phi": "φ",
    "chi": "χ", "psi": "ψ", "omega": "ω",
    "Infinity": "∞",
    "LeftArrow": "←", "RightArrow": "→",
    "UpArrow": "↑", "DownArrow": "↓",
    "LeftRightArrow": "↔",
    "LessEqual": "≤", "GreaterEqual": "≥",
    "NotEqual": "≠",
    "PlusMinus": "±",
    "Times": "×",
    "Element": "∈",
    "Ellipsis": "…",
    "CloseCurlyQuote": "\u2019",
    "OpenCurlyQuote": "\u2018",
    "CloseCurlyDoubleQuote": "\u201d",
    "OpenCurlyDoubleQuote": "\u201c",
    "NonBreakingSpace": "\u00a0",
    "EAcute": "é", "Eacute": "é",
    "AAcute": "á",
    "OAcute": "ó",
    "UAcute": "ú",
    "IAcute": "í",
    "AGrave": "à",
    "EGrave": "è",
    "OGrave": "ò",
    "UGrave": "ù",
    "AUmlaut": "ä", "OUmlaut": "ö", "UUmlaut": "ü",
    "Rule": "→",
    "FilledSmallCircle": "•",
    "VerticalSeparator": "|",
    "PartialD": "∂",
    "CapitalDifferentialD": "d",
    "DifferentialD": "d",
    "ExponentialE": "e",
    "ImaginaryI": "i",
    "CapitalDelta": "Δ",
    "CapitalGamma": "Γ",
    "CapitalTheta": "Θ",
    "CapitalLambda": "Λ",
    "CapitalXi": "Ξ",
    "CapitalPi": "Π",
    "CapitalSigma": "Σ",
    "CapitalUpsilon": "Υ",
    "CapitalPhi": "Φ",
    "CapitalPsi": "Ψ",
    "CapitalOmega": "Ω",
    "Integral": "∫",
    "Sum": "∑",
    "Product": "∏",
    "ForAll": "∀",
    "Exists": "∃",
    "Sqrt": "√",
    "And": "∧",
    "Or": "∨",
    "Not": "¬",
    "Implies": "⇒",
    "Equivalent": "⟺",
    "Subset": "⊂",
    "Union": "∪",
    "Intersection": "∩",
    "EmptySet": "∅",
    "LineSeparator": "\n",
    "ParagraphSeparator": "\n\n",
    "SmallCircle": "∘",
    "FilledSmallCircle": "•",
    "Bullet": "•",
    "Dash": "–",
    "LongDash": "—",
    "Degree": "°",
    "Copyright": "©",
    "RegisteredTrademark": "®",
    "Trademark": "™",
    "Micro": "μ",
    "RoundSpaceIndicator": " ",
    "SpaceIndicator": " ",
    "IndentingNewLine": "\n",
    "NewLine": "\n",
    "Tab": "\t",
    "DoubleStruckCapitalR": "ℝ",
    "DoubleStruckCapitalC": "ℂ",
    "DoubleStruckCapitalZ": "ℤ",
    "DoubleStruckCapitalN": "ℕ",
    "DoubleStruckCapitalQ": "ℚ",
}


def replace_wolfram_chars(s: str, math: bool = False) -> str:
    """Replace \\[Name] escape sequences with LaTeX or Unicode."""
    table = MATH_CHARS if math else TEXT_CHARS

    def replace(m):
        name = m.group(1)
        if math:
            return table.get(name, f"\\text{{\\textbackslash[{name}]}}")
        else:
            return table.get(name, f"[{name}]")

    return re.sub(r"\\\[(\w+)\]", replace, s)


# ── Box → LaTeX conversion ───────────────────────────────────────────────────

def needs_braces(s: str) -> str:
    """Wrap in braces if more than one character."""
    if len(s) <= 1:
        return s
    return "{" + s + "}"


def box_to_latex(node) -> str:
    """
    Recursively convert a parsed box node to a LaTeX string.

    `node` is one of:
      - str  (a Mathematica string literal, already unquoted)
      - list [head, arg1, arg2, ...]  (a Mathematica expression)
    """
    if isinstance(node, str):
        # Bare string token — convert special chars, escape LaTeX specials
        s = replace_wolfram_chars(node, math=True)
        # Don't escape if it already looks like a LaTeX command
        if s.startswith("\\") or s in ("+", "-", "=", ",", ".", ";", ":", "!", "?",
                                        "(", ")", "[", "]", "|", "/", "*", "'", "^", "_"):
            return s
        # Escape common LaTeX specials in plain identifiers
        s = s.replace("%", r"\%").replace("&", r"\&").replace("#", r"\#")
        return s

    if not isinstance(node, list) or not node:
        return ""

    head = node[0]
    args = node[1:]

    match head:

        # Graphics objects embedded in math/text — not renderable as LaTeX
        case ("GraphicsBox" | "Graphics3DBox" | "RasterBox" | "CompressedData"
              | "DynamicBox" | "DynamicModuleBox"):
            return ""   # silently skip

        case "RowBox":
            # args = [list_of_children]
            children = args[0] if args and isinstance(args[0], list) else args
            return "".join(box_to_latex(c) for c in children)

        case "FractionBox":
            num = box_to_latex(args[0]) if len(args) > 0 else ""
            den = box_to_latex(args[1]) if len(args) > 1 else ""
            return rf"\frac{{{num}}}{{{den}}}"

        case "SuperscriptBox":
            base = box_to_latex(args[0]) if len(args) > 0 else ""
            exp  = box_to_latex(args[1]) if len(args) > 1 else ""
            return f"{needs_braces(base)}^{{{exp}}}"

        case "SubscriptBox":
            base = box_to_latex(args[0]) if len(args) > 0 else ""
            sub  = box_to_latex(args[1]) if len(args) > 1 else ""
            return f"{needs_braces(base)}_{{{sub}}}"

        case "SubsuperscriptBox":
            base = box_to_latex(args[0]) if len(args) > 0 else ""
            sub  = box_to_latex(args[1]) if len(args) > 1 else ""
            exp  = box_to_latex(args[2]) if len(args) > 2 else ""
            return f"{needs_braces(base)}_{{{sub}}}^{{{exp}}}"

        case "UnderoverscriptBox":
            base  = box_to_latex(args[0]) if len(args) > 0 else ""
            under = box_to_latex(args[1]) if len(args) > 1 else ""
            over  = box_to_latex(args[2]) if len(args) > 2 else ""
            return rf"\underset{{{under}}}{{\overset{{{over}}}{{{base}}}}}"

        case "OverscriptBox":
            base = box_to_latex(args[0]) if len(args) > 0 else ""
            over = box_to_latex(args[1]) if len(args) > 1 else ""
            # Common: dot/double-dot for derivatives
            over_s = over.strip()
            if over_s in (".", r"\bullet", "·"):
                return rf"\dot{{{base}}}"
            if over_s == "..":
                return rf"\ddot{{{base}}}"
            if over_s == r"\to" or over_s == "→":
                return rf"\vec{{{base}}}"
            return rf"\overset{{{over}}}{{{base}}}"

        case "UnderscriptBox":
            base  = box_to_latex(args[0]) if len(args) > 0 else ""
            under = box_to_latex(args[1]) if len(args) > 1 else ""
            return rf"\underset{{{under}}}{{{base}}}"

        case "SqrtBox":
            arg = box_to_latex(args[0]) if args else ""
            return rf"\sqrt{{{arg}}}"

        case "RadicalBox":
            arg = box_to_latex(args[0]) if len(args) > 0 else ""
            n   = box_to_latex(args[1]) if len(args) > 1 else ""
            return rf"\sqrt[{n}]{{{arg}}}"

        case "StyleBox":
            # StyleBox[expr, options...] — render the expr, ignore styling
            return box_to_latex(args[0]) if args else ""

        case "FormBox":
            # FormBox[expr, TraditionalForm|StandardForm|...]
            return box_to_latex(args[0]) if args else ""

        case "GridBox":
            # Render as a LaTeX matrix (pmatrix)
            if not args:
                return ""
            rows = args[0]  # list of rows, each row is a list of cells
            if not isinstance(rows, list):
                return box_to_latex(rows)
            latex_rows = []
            for row in rows:
                if isinstance(row, list):
                    latex_rows.append(" & ".join(box_to_latex(cell) for cell in row))
                else:
                    latex_rows.append(box_to_latex(row))
            body = r" \\ ".join(latex_rows)
            return rf"\begin{{pmatrix}} {body} \end{{pmatrix}}"

        case "TagBox":
            # TagBox[expr, tag, ...] — render expr only
            return box_to_latex(args[0]) if args else ""

        case "AdjustmentBox" | "InterpretationBox" | "TooltipBox":
            return box_to_latex(args[0]) if args else ""

        case "TemplateBox":
            # TemplateBox[{args}, "template_name", ...] — best-effort
            return "".join(box_to_latex(a) for a in (args[0] if args and isinstance(args[0], list) else []))

        case "ButtonBox":
            return box_to_latex(args[0]) if args else ""

        case "PanelBox":
            return box_to_latex(args[0]) if args else ""

        case "BoxData":
            return box_to_latex(args[0]) if args else ""

        case _:
            # Unknown head — warn once and try to render children
            warnings.warn(f"box_to_latex: unknown head {head!r}", stacklevel=2)
            return "".join(box_to_latex(a) for a in args)
