{% import "variables.include" as var %}
{% import 'variables.private.include' as pvt %}
output "NEXT-STEPS" {
  value = <<EOF
1. Login via:
ssh ubuntu@nerdwars-linux.monkeybox.org

2. Once server has rebooted, reate credentials file:
cat <<EO2 > /root/credentials.sh
#! /bin/bash
export STEAM_USERNAME="{{ pvt.steam_username }}"
export STEAM_PASSWORD="{{ pvt.steam_password }}"
EO2
2. Run install.sh:
  sudo su - 
  cd nerdwars_servers
  ./install.sh
EOF
}
