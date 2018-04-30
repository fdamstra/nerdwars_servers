#! /bin/bash
#
# Run this on the instance to get NS2 running

source ../../credentials.sh

cd /root/steam
# 220070 is chivalry linux dedicated server
./steamcmd.sh +login ${STEAM_USERNAME} ${STEAM_PASSWORD} +force_install_dir /root/steam/natural_selection_2 +app_update 4940 validate +quit
