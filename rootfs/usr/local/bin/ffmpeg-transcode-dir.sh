#!/bin/bash

# don't process empty globs
shopt -s nullglob

[[ -z "${1}" ]] && source='.' || source="${1}"

for file in $(find "${source}" \
    \( -iname \*.flv \
    -o -iname \*.f4v \
    -o -iname \*.wmv \
    -o -iname \*.mov \
    -o -iname \*.mkv \
    -o -iname \*.mp4 \
    -o -iname \*.avi \
    -o -iname \*.mpg \) | sort -R); do
    filename=$(basename -- "$file")
    extension="${filename##*.}"
    filename="${filename%.*}"

    ffmpeg-transcode.sh -i "${file}" \
        -f "crop=$(ffmpeg-cropdetect.sh "${file}" -q)" -o encoded &&
        [[ -f "encoded/${filename}.mp4" ]] && rm -f "${file}"
done
