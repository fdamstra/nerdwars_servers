{% import 'variables.include' as var %}
{% import 'variables.private.include' as pvt %}

###################
# Nerdwars Linux Instance
resource "aws_instance" "nerdwars_linux" {
  ami = "${data.aws_ami.ubuntu.id}"
#  ami = "${data.aws_ami.centos7.id}"
  instance_type = "${var.Nerdwars-Linux-Instance-Type}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  subnet_id = "${aws_subnet.subnet_Nerdwars.id}"
  ebs_optimized = "${var.EBS-Optimized}"
  disable_api_termination = false
  associate_public_ip_address = true
  instance_initiated_shutdown_behavior = "terminate"
  key_name = "${var.AWS-Key-Pair-Name}"
  vpc_security_group_ids = ["${aws_security_group.sg_all_open.id}"]
  depends_on    = ["aws_internet_gateway.gw_primary"]

  tags {
    Name = "nerdwars_linux"
  }

  root_block_device {
    volume_type = "${ var.Default-Volume-Type }"
    volume_size = "${ var.Nerdwars-Linux-Volume-Size }" # Gigabytes
    delete_on_termination = true
  }

  ebs_block_device {
    device_name = "/dev/sdd"
    volume_size = "${var.Swap-Volume-Size}"
    volume_type = "${var.Swap-Volume-Type}"
    delete_on_termination = true
  }

  user_data = <<EOF
#cloud-config
package_update: true
package_upgrade: true
packages:
  - git
  - vim
  - wget
  - curl
  - tcpdump
  - python
runcmd:
  - mkswap /dev/xvdd
  - swapon -a
  - dpkg --add-architecture i386
  - apt-get -y update
  - apt-get -y
  - mkdir /root/steam
  - cd /root/steam
  - wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz 
  - tar zxf steamcmd_linux.tar.gz
  - cd /root
  - git clone https://github.com/fdamstra/nerdwars_servers.git
  - chmod 755 nerdwars_servers/install.sh
mounts:
  - [ xvdd, none, swap, sw, 0, 0 ]
growpart:
  mode: auto
  devices: ['/']
  ignore_growroot_disabled: false
power_state:
  delay: "now"
  mode: "reboot"
  message: "Rebooting after first init."
  condition: True
EOF
# To reboot, add the following above the EOF line:
# power_state:
#   delay: "+0"
#   mode: "reboot"
#   message: "Rebooting after first init."
#   condition: True

  # Fix issues with cached keys. Arguably less secure, but also way less annoying
  provisioner "local-exec" {
    command = "ssh-keygen -f ~/.ssh/known_hosts -R nerdwars-linux.${var.Domain-Name}"
  }
}

# Give me the IP Addresses
output "nerdwars_linux_mgmt_ip" {
    value = "${aws_instance.nerdwars_linux.public_ip}"
}

# Give me DNS entries
resource "aws_route53_record" "nerdwars_linux" {
  zone_id = "${var.Domain-Zone-ID}"
  name = "nerdwars-linux.${var.Domain-Name}"
  type = "A"
  ttl = "300"
  records = ["${aws_instance.nerdwars_linux.public_ip}"]
}
resource "aws_route53_record" "nerdwars_linux_pvt" {
  zone_id = "${var.Domain-Zone-ID}"
  name = "nerdwars_linux_pvt.lab.${var.Domain-Name}"
  type = "A"
  ttl = "300"
  records = ["${aws_instance.nerdwars_linux.private_ip}"]
}
output "nerdwars_linux_dns" {
  value = "${aws_route53_record.nerdwars_linux.name}"
}

