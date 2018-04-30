#! /bin/bash
#
# Run this on the instance to get chivalry running
mkdir ~/steam
cd ~/steam
wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz
tar zxf steamcmd_linux.tar.gz
# 220070 is chivalry linux dedicated server
./steamcmd.sh +login anonymous +app_update 220070 +quit
cp ~/steam/linux32/steamclient.so ~/steam/steamapps/common/chivalry_ded_server/Binaries/Linux/lib/
echo 219640 > steamapps/common/chivalry_ded_server/Binaries/Linux/steam_appid.txt
echo ""
echo Run once, and then edit ~/.local/.../PCServer-UDKGame.ini
echo Under \[Engine.AccessControl\], set:
echo "  " GamePassword=mypassword
echo "  " AdminPassword=mypassword
echo Under \[Engine.GameReplicationInfo\], set:
echo "  " ServerName=MonkeyBOX
echo For other options, see this guide: https://forums.tornbanner.com/topic/7805/dedicated-server-download-and-configuration-guide
echo To start server, run:
echo "  " cd /root/steam/steamapps/common/chivalry_ded_server/Binaries/Linux \&\& ./UDKGameServer-Linux AOCCTF-Moor_p?steamsockets -Port=7000 -QueryPort=7500 -seekfreeloadingserver


