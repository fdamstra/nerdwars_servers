#! /bin/bash
#
# Run this on the instance to get chivalry running

source /root/credentials.sh

cd /root/steam
./steamcmd.sh +login ${STEAM_USERNAME} ${STEAM_PASSWORD} +app_update 730 validate +quit

