#! /bin/bash

source /root/credentials.sh

cd /root/steam
./steamcmd.sh +login ${STEAM_USERNAME} ${STEAM_PASSWORD} +force_install_dir /root/overload +app_update 448850 validate +quit

#cp /root/nerdwars_servers/apps/csgo/{autoexec.cfg,server.cfg} /root/csgo/csgo/cfg
