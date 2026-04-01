#!/usr/bin/env bash
# build_all.sh — Parse all 22 Mathematica notebooks into Hugo content pages.
#
# Usage:
#   ./scripts/build_all.sh [notebooks-dir]
#
# Default notebooks dir: ../MAM2046 (relative to this script's project root)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
NB_DIR="${1:-$(cd "$PROJECT_DIR/../MAM2046" && pwd)}"

PARSER="$SCRIPT_DIR/parse_nb.py"

echo "=== Building all notebooks ==="
echo "  Notebooks: $NB_DIR"
echo "  Output:    $PROJECT_DIR/content/"
echo ""

# Map of notebook files → content filenames, weights, and image dirs
# Format: nb_file:output_md:weight:images_dir
NOTEBOOKS=(
  "MAM20462NDpart0.nb:ch0-introduction.md:0:part0"
  "MAM20462NDpart11.nb:ch1-1-phase-portraits.md:11:part11"
  "MAM20462NDpart12.nb:ch1-2-existence-uniqueness.md:12:part12"
  "MAM20462NDpart13.nb:ch1-3-fixed-points.md:13:part13"
  "MAM20462NDpart14-2.nb:ch1-4-conservative-systems.md:14:part14-2"
  "MAM20462NDpart15.nb:ch1-5-reversible-systems.md:15:part15"
  "MAM20462NDpart16.nb:ch1-6-index-theory.md:16:part16"
  "MAM20462NDpart21.nb:ch2-1-limit-cycles.md:21:part21"
  "MAM20462NDpart22.nb:ch2-2-ruling-out-closed-orbits.md:22:part22"
  "MAM20462NDpart23.nb:ch2-3-poincare-bendixson.md:23:part23"
  "MAM20462NDpart24.nb:ch2-4-lienard-systems.md:24:part24"
  "MAM20462NDpart25.nb:ch2-5-relaxation-oscillations.md:25:part25"
  "MAM20462NDpart26.nb:ch2-6-weakly-nonlinear-oscillators.md:26:part26"
  "MAM20462NDpart31.nb:ch3-1-saddle-node-bifurcation.md:31:part31"
  "MAM20462NDpart32.nb:ch3-2-hopf-bifurcation.md:32:part32"
  "MAM20462NDpart33.nb:ch3-3-oscillating-reactions.md:33:part33"
  "MAM20462NDpart34.nb:ch3-4-global-bifurcations.md:34:part34"
  "MAM20462NDpart35.nb:ch3-5-coupled-oscillators.md:35:part35"
  "MAM20462NDpart36.nb:ch3-6-poincare-maps.md:36:part36"
  "MAM20462NDpart41.nb:ch4-1-lorenz-equations.md:41:part41"
  "MAM20462NDpart41b.nb:ch4-1b-lorenz-continued.md:42:part41b:Lorenz Equations (Continued)"
  "MAM20462NDpart42.nb:ch4-2-detecting-chaos.md:43:part42"
)

TOTAL=${#NOTEBOOKS[@]}
SUCCESS=0
FAILED=0

for entry in "${NOTEBOOKS[@]}"; do
  IFS=':' read -r nb_file md_file weight img_dir title_override <<< "$entry"

  nb_path="$NB_DIR/$nb_file"
  md_path="$PROJECT_DIR/content/$md_file"

  if [ ! -f "$nb_path" ]; then
    echo "SKIP: $nb_file (not found)"
    FAILED=$((FAILED + 1))
    continue
  fi

  echo "[$((SUCCESS + FAILED + 1))/$TOTAL] $nb_file → $md_file"
  if [ -n "$title_override" ]; then
    python3 "$PARSER" "$nb_path" "$md_path" \
      --images-dir "/images/$img_dir" \
      --weight "$weight" \
      --title "$title_override" 2>&1 | grep -v "UserWarning" | sed 's/^/  /'
  else
    python3 "$PARSER" "$nb_path" "$md_path" \
      --images-dir "/images/$img_dir" \
      --weight "$weight" 2>&1 | grep -v "UserWarning" | sed 's/^/  /'
  fi

  if [ $? -eq 0 ]; then
    SUCCESS=$((SUCCESS + 1))
  else
    FAILED=$((FAILED + 1))
  fi
done

echo ""
echo "=== Done ==="
echo "  Success: $SUCCESS / $TOTAL"
echo "  Failed:  $FAILED / $TOTAL"
