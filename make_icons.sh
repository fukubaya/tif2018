#!/bin/sh

readonly DIR="public/img/icons"
readonly ORG_IMG="$DIR/android-chrome-512x512.png"

convert "${ORG_IMG}" -resize 192x192 "${DIR}/android-chrome-192x192.png"
convert "${ORG_IMG}" -resize 120x120 "${DIR}/apple-touch-icon-120x120.png"
convert "${ORG_IMG}" -resize 152x152 "${DIR}/apple-touch-icon-152x152.png"
convert "${ORG_IMG}" -resize 180x180 "${DIR}/apple-touch-icon-180x180.png"
convert "${ORG_IMG}" -resize 60x60 "${DIR}/apple-touch-icon-60x60.png"
convert "${ORG_IMG}" -resize 76x76 "${DIR}/apple-touch-icon-76x76.png"
convert "${ORG_IMG}" -resize 180x180 "${DIR}/apple-touch-icon.png"
convert "${ORG_IMG}" -resize 16x16 "${DIR}/favicon-16x16.png"
convert "${ORG_IMG}" -resize 32x32 "${DIR}/favicon-32x32.png"
convert "${ORG_IMG}" -resize 144x144 "${DIR}/msapplication-icon-144x144.png"
convert "${ORG_IMG}" -resize 150x150 "${DIR}/mstile-150x150.png"
