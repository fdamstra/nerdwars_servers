#! /bin/bash
#
# Run this on the instance to get chivalry running

source /root/credentials.sh

cd /root/steam
./steamcmd.sh +login ${STEAM_USERNAME} ${STEAM_PASSWORD} +app_update 740 validate +quit

cp autoexec.cfg server.cfg "/root/steam/steamapps//common/Counter-Strike\ Global\ Offensive\ Beta\ -\ Dedicated\ Server/csgo/"
