#!/bin/bash

# don't process empty globs
shopt -s nullglob

for file in $(ls *.{flv,f4v,wmv,mov,mkv,mp4,avi,mpg} | sort -R); do
        filename=$(basename -- "$file")
        extension="${filename##*.}"
        filename="${filename%.*}"

        ffmpeg-transcode.sh -i "${file}" \
            -f "crop=$(ffmpeg-cropdetect.sh "${file}" -q)" -o done && \
            [[ -f "done/${filename}.mp4" ]] && rm -f $file
done
