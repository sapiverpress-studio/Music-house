#!/usr/bin/env bash
set -euo pipefail

rm -rf dist
mkdir -p dist/assets/art

# Copy HTML source.
cp index.html explore.html grownups.html music-maker.html dist/
cp -R lessons keyboard dist/

# Reconstruct larger static assets from Git-friendly source chunks.
cat src-chunks/app.js.part* > dist/app.js
cat src-chunks/styles.css.part* > dist/styles.css
cat src-chunks/keyboard.js.part* > dist/keyboard.js

# Copy the approved story artwork into this deploy from the immutable
# production snapshot that currently contains the 18 web-optimised images.
ASSET_BASE="https://6aaa876af7a7680a38799ad3--henandbeas-musichouse.netlify.app/assets/art"
assets=(
  "01_G1_CH01_STORY_P01_8.5-square.webp"
  "02_G1_CH01_STORY_P02_8.5-square.webp"
  "03_G1_CH02_STORY_P01_8.5-square.webp"
  "04_G1_CH02_STORY_P02_8.5-square.webp"
  "05_G1_CH03_STORY_P01_8.5-square.webp"
  "06_G1_CH03_STORY_P02_8.5-square.webp"
  "07_G1_CH04_STORY_P01_8.5-square.webp"
  "08_G1_CH04_STORY_P02_8.5-square.webp"
  "09_G1_CH05_STORY_P01_8.5-square.webp"
  "10_G1_CH05_STORY_P02_8.5-square.webp"
  "11_G1_CH06_STORY_P01_8.5-square.webp"
  "12_G1_CH06_STORY_P02_8.5-square.webp"
  "13_G1_CH07_STORY_P01_8.5-square.webp"
  "14_G1_CH07_STORY_P02_8.5-square.webp"
  "15_G1_CH08_STORY_P01_8.5-square.webp"
  "16_G1_CH08_STORY_P02_8.5-square.webp"
  "17_G1_CH09_STORY_P01_8.5-square.webp"
  "18_G1_CH09_STORY_P02_8.5-square.webp"
)

for asset in "${assets[@]}"; do
  echo "Fetching ${asset}"
  curl --fail --silent --show-error --location \
    "${ASSET_BASE}/${asset}" \
    --output "dist/assets/art/${asset}"
done

echo "Hen & Bea Music House built in dist/"
