#!/bin/sh

rsync -aze ssh ~/Pictures/Wallpapers gitpi:~/Pictures --bwlimit=5000 --progress --delete
