#! /bin/bash
#
# Run this on the instance to get NS2 running
if [[! -f /root/credentials.sh ]]
then
	echo You must first create /root/credentials.sh
fi

source /root/credentials.sh

apt-get install -y speex:i386 libgtk2.0-0:i386 lib32gcc1

cd /root/steam
./steamcmd.sh +login ${STEAM_USERNAME} ${STEAM_PASSWORD} +force_install_dir /root/natural_selection_2 +app_update 4940 validate +quit

mkdir -p /root/natural_selection_2/config
cp /root/nerdwars_servers/apps/natural_selection_2/MapCycle.json /root/natural_selection_2/config

