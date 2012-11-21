meh
===

I often have the feeling, that I look grumpy or just *meh* while working on my
computer. So in order to check, I wrote *meh.sh*

*meh.sh* is a shell script, which takes a photo from the webcam. It does so, by
using [mplayer](http://www.mplayerhq.hu/design7/news.html). The script should be
installed as an hourly cron job like this:

    @hourly /path/to/meh.sh

To make it a bit more interesting, the script will not take the photo
immediately, but will sleep for a random number of minutes, so that you are not
prepared for the photo.

All photos are stored in */path/where/you/cloned/this/photos*.

Have fun and smile more, b/c you are on camera :)
