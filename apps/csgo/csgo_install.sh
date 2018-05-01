#! /bin/bash
#
# Run this on the instance to get chivalry running

source /root/credentials.sh

cd /root/steam
./steamcmd.sh +login ${STEAM_USERNAME} ${STEAM_PASSWORD} +force_install_dir /root/csgo +app_update 740 validate +quit

cp /root/nerdwars_servers/apps/csgo/{autoexec.cfg,server.cfg} /root/csgo/csgo/cfg
