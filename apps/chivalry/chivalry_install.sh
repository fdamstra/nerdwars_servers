#! /bin/bash
#
# Run this on the instance to get chivalry running
cd /root/steam
# 220070 is chivalry linux dedicated server
./steamcmd.sh +login anonymous +app_update 220070 validate +quit
cp /root/steam/linux32/steamclient.so ~/steam/steamapps/common/chivalry_ded_server/Binaries/Linux/lib/
cp /root/nerdwars_servers/apps/chivalry/PCServer-UDKGame.ini /root/steam/steamapps/common/chivalry_ded_server/UDKGame/Config/PCServer-UDKGame.ini
echo 219640 > steamapps/common/chivalry_ded_server/Binaries/Linux/steam_appid.txt

