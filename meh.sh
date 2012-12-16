#!/bin/bash

# written by Andre Kelpe, efeshundertelf at googlemail dot com
# license: MIT

notify=0 # 1 = send a notification, 0 = don't

# cron has no PATH, so let's fix that first
export PATH=/bin:/usr/bin

# if not run by root, use x.org conformant method to retrieve user pictures
# directory, see http://freedesktop.org/wiki/Software/xdg-user-dirs
if [ $(id -u) -ne 0 ]
then
  DIR="$(xdg-user-dir PICTURES)"/meh
else
  # where the script itself is stored
  DIR="$( cd "$( dirname "$0" )" && pwd )"/photos
fi

if [ ! -d $DIR ]
then
    mkdir -p $DIR
fi

cd $DIR

# sleep for a random amount of minutes, so we don't know, when the photo is
# taken
sleep $(expr $RANDOM % 60)m

# we cannot give a filename to mplayer, that's whe we rename afterwards
fname=$(date +"%s").png

mplayer -vo png -frames 2 tv:// > /dev/null 2> /dev/null

rm 00000001.png # it takes a while for some cams to initialize
mv 00000002.png $fname

if [ $notify -eq 1 ]
then
    DISPLAY=:0.0 notify-send -i $DIR/$fname 'Gotcha' \
        "You've been meh-ed\! Have fun and smile more, b/c you're on camera :)"
fi

