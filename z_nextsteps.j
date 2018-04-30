{% import "variables.include" as var %}
output "NEXT-STEPS" {
  value = <<EOF
1. Login via:
  ssh ubuntu@nerdwars-linux.monkeybox.org
2. Run install.sh:
  sudo su - 
  ./install.sh
EOF
}
