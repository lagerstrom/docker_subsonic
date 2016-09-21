#!/bin/bash

###################################################################################
#
# Shell script for starting Subsonic.
#
# http://subsonic.org
#
###################################################################################

# Gets the options from configuration file
source /etc/default/subsonic
# Both $SUBSONIC_HOME and #SUBSONIC_ARGS are sourced from
# the config file.

if [ ! -f "$SUBSONIC_HOME/transcode/ffmpeg" ]; then
    cp /var/subsonic/transcode/ffmpeg "$SUBSONIC_HOME/transcode/ffmpeg"
fi

if [ ! -f "$SUBSONIC_HOME/transcode/lame" ]; then
    cp /var/subsonic/transcode/lame "$SUBSONIC_HOME/transcode/lame"
fi

su $SUBSONIC_USER -c "/usr/bin/subsonic $SUBSONIC_ARGS"
sleep 5
tail -f /subsonic/subsonic_sh.log
