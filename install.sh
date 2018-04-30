#! /bin/bash

# Save all output
exec > >(tee -i /root/install.log)
exec 2>&1

# Install 386 compatibility
dpkg --add-architecture i386
apt-get -y update
apt-get -y install libstdc++6:i386

# Install steamcmd
mkdir /root/steam
cd /root/steam
wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz
tar zxf steamcmd_linux.tar.gz

# Install git repo
#cd /root
#git clone https://github.com/fdamstra/nerdwars_servers.git

# Install Apps
cd /root/nerdwars_servers/apps
for a in *
do
	echo \*\*\* Installing ${a} 
	cp ${a}/${a}_start* ~/ 
	chmod 755 ~/${a}_start*
	bash ${a}/${a}_install.sh
	echo \*\*\* Install of ${a} complete.
done

