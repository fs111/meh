#!/bin/bash

# written by Andre Kelpe, efeshundertelf at googlemail dot com
# license: MIT

# cron has no PATH, so let's fix that first
export PATH=/bin:/usr/bin

# where the script itself is stored
DIR="$( cd "$( dirname "$0" )" && pwd )"

PHOTO_DIR=$DIR/photos

if [ ! -d $PHOTO_DIR ]
then
    mkdir -p $PHOTO_DIR
fi

cd $PHOTO_DIR

# sleep for a random amount of minutes, so we don't know, when the photo is
# taken
sleep $(expr $RANDOM % 60)m

# we cannot give a filename to mplayer, that's whe we rename afterwards
fname=$(date +"%s").png

mplayer -vo png -frames 1 tv:// > /dev/null 2> /dev/null

mv 00000001.png $fname
