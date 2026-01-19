#!/bin/bash
for f in *.avi ; do ffmpeg -i "$f" -vf "transpose=1" "${f%.avi}_Flipa.avi";
done
