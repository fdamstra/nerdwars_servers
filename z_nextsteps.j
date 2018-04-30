{% import "variables.include" as var %}
{% import 'variables.private.include' as pvt %}
output "NEXT-STEPS" {
  value = <<EOF
1. Login via:
ssh ubuntu@nerdwars-linux.monkeybox.org

2. Once server has rebooted, run:

sudo su - 
cat <<EO2 > /root/credentials.sh
#! /bin/bash
export STEAM_USERNAME="{{ pvt.steam_username }}"
export STEAM_PASSWORD="{{ pvt.steam_password }}"
export CSGO_KEY="{{ pvt.csgo_key }}"
EO2

cd nerdwars_servers
./install.sh

After installing natural selection servers, you can access http://nerdwars-linux.monkeybox.org:8080/index.html

EOF
}
