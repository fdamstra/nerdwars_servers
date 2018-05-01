#! /bin/bash

MYIP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

cd /root/natural_selection_2/x64
./server_linux -name \"MonkeyBOX\" -password nerdwars -port 27015 -webadmin -webdomain \"${MYIP}\" -webuser admin -webpassword nerdwars -webport 8080 -map ns2_summit -limit 12 -config_path /root/natural_selection_2/config/
