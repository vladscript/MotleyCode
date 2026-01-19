#!/bin/bash
for f in *.mkv ; do ffmpeg -i "$f" -vf format=gray "${f%.mkv}_GRAY.mp4";
done
