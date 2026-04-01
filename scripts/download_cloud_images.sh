#!/usr/bin/env bash
# download_cloud_images.sh — Download rendered graphics from Wolfram Cloud notebooks.
#
# Usage:
#   ./scripts/download_cloud_images.sh [part_name]
#
# Examples:
#   ./scripts/download_cloud_images.sh              # download for ALL notebooks
#   ./scripts/download_cloud_images.sh part11        # download for part11 only
#
# Requires: curl, grep

set -euo pipefail

CLOUD_BASE="https://www.wolframcloud.com/obj/jon.shock/MAM20462ND"
IMAGES_DIR="static/images"

# Map: cloud_url_suffix:local_dir (if different from URL suffix)
PARTS=(
  "part0"
  "part11" "part12" "part13" "part14:part14-2" "part15" "part16"
  "part21" "part22" "part23" "part24" "part25" "part26"
  "part31" "part32" "part33" "part34" "part35" "part36"
  "part41" "part41b" "part42"
)

download_images_for_part() {
  local spec="$1"
  local cloud_part="${spec%%:*}"
  local local_dir="${spec##*:}"
  local url="${CLOUD_BASE}${cloud_part}"
  local out_dir="${IMAGES_DIR}/${local_dir}"

  echo "=== ${part} ==="
  echo "  Fetching ${url} ..."

  # Download page and extract image paths
  local html
  html=$(curl -sL --max-time 30 "${url}" 2>/dev/null) || {
    echo "  SKIP: could not fetch page (may require authentication)"
    return 0
  }

  local img_paths
  img_paths=$(echo "${html}" | grep -o 'src="[^"]*htmlcaches/images/[^"]*"' | sed 's/src="//;s/"$//' || true)

  if [ -z "${img_paths}" ]; then
    echo "  No images found (notebook may have no graphics output)"
    return 0
  fi

  local count
  count=$(echo "${img_paths}" | wc -l | tr -d ' ')
  echo "  Found ${count} image(s)"

  mkdir -p "${out_dir}"

  local i=0
  while IFS= read -r img_path; do
    i=$((i + 1))
    local img_url="https://www.wolframcloud.com${img_path}"
    local filename
    filename=$(printf "output_%03d.png" "${i}")
    echo "  Downloading ${filename} ..."
    curl -sL --max-time 20 "${img_url}" -o "${out_dir}/${filename}" || {
      echo "    WARN: failed to download ${filename}"
    }
  done <<< "${img_paths}"

  echo "  Done: ${count} image(s) → ${out_dir}/"
}

# Main
cd "$(dirname "$0")/.."

if [ $# -ge 1 ]; then
  download_images_for_part "$1"
else
  for part in "${PARTS[@]}"; do
    download_images_for_part "${part}"
    sleep 1  # be polite to the server
  done
fi

echo ""
echo "=== Summary ==="
for part in "${PARTS[@]}"; do
  local_dir="${IMAGES_DIR}/${part}"
  if [ -d "${local_dir}" ]; then
    n=$(ls "${local_dir}"/output_*.png 2>/dev/null | wc -l | tr -d ' ')
    echo "  ${part}: ${n} image(s)"
  fi
done
