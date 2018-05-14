#!/bin/sh

rsync -azre ssh gitpi:~/Pictures/Wallpapers ~/Pictures --bwlimit=5000 --progress
rsync -azre ssh ~/Pictures/Wallpapers gitpi:~/Pictures --bwlimit=5000 --progress --delete
