#! /bin/bash
#
# Run this on the instance to get chivalry running
cd /root/steam
# 220070 is chivalry linux dedicated server
./steamcmd.sh +login anonymous +force_install_dir /root/chivalry +app_update 220070 validate +quit
cp /root/steam/linux32/steamclient.so /root/chivalry/Binaries/Linux/lib/
cp /root/nerdwars_servers/apps/chivalry/PCServer-UDKGame.ini /root/chivalry/UDKGame/Config/PCServer-UDKGame.ini
echo 219640 > /root/chivalry/Binaries/Linux/steam_appid.txt

