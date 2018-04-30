#! /bin/bash
#
# Run this on the instance to get NS2 running
cd /root/steam
# 220070 is chivalry linux dedicated server
./steamcmd.sh +login anonymous +force_install_dir /root/steam/natural_selection_2 +app_update 4940 validate +quit
