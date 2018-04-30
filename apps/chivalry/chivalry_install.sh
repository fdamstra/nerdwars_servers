#! /bin/bash
#
# Run this on the instance to get chivalry running
cd ~/steam
# 220070 is chivalry linux dedicated server
./steamcmd.sh +login anonymous +app_update 220070 +quit
cp ~/steam/linux32/steamclient.so ~/steam/steamapps/common/chivalry_ded_server/Binaries/Linux/lib/
echo 219640 > steamapps/common/chivalry_ded_server/Binaries/Linux/steam_appid.txt

