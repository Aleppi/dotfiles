#!/bin/sh

rsync -azre ssh pi@$GITPI_IP:~/Pictures/Wallpapers ~/Pictures --bwlimit=5000 --progress
rsync -azre ssh ~/Pictures/Wallpapers pi@$GITPI_IP:~/Pictures --bwlimit=5000 --progress --delete
