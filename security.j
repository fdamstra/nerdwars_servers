{% import 'variables.include' as var %}

###########################
## Honeypot Secured Access
#resource "aws_security_group" "sg_honeypot_secured_access" {
#  name        = "sg_honeypot_secured_access"
#  description = "Allows ssh from me. Allows select outbound for updates and such."
#  vpc_id      = "${aws_vpc.vpc_primary.id}"
#
#  # SSH for management from me
#  ingress {
#    from_port = 22
#    to_port = 22
#    protocol = "tcp"
#    cidr_blocks = ["${var.Trusted-CIDR}", "${var.VPC-Subnet}"]
#  }
#
#  # Outbound Access
#  egress {
#    from_port = 20
#    to_port = 21
#    protocol = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#  egress {
#    from_port = 22
#    to_port = 22
#    protocol = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#  egress {
#    from_port = 53
#    to_port = 53
#    protocol = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#  egress {
#    from_port = 53
#    to_port = 53
#    protocol = "udp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#  egress {
#    from_port = 80
#    to_port = 80
#    protocol = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#  egress {
#    from_port = 443
#    to_port = 443
#    protocol = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#  egress {
#    from_port = 8089
#    to_port = 8089
#    protocol = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#  egress {
#    from_port = 9997
#    to_port = 9997
#    protocol = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#}
#
###########################
## Splunk Secured Access
#resource "aws_security_group" "sg_splunk_secured_access" {
#  name        = "sg_splunk_secured_access"
#  description = "Allows ssh, http, and https from me. Allows select outbound for updates and such."
#  vpc_id      = "${aws_vpc.vpc_primary.id}"
#
#  # SSH for management from me
#  ingress {
#    from_port = 22
#    to_port = 22
#    protocol = "tcp"
#    cidr_blocks = ["${var.Trusted-CIDR}"]
#  }
#  ingress {
#    from_port = 80
#    to_port = 80
#    protocol = "tcp"
#    cidr_blocks = ["${var.Trusted-CIDR}"]
#  }
#  ingress {
#    from_port = 443
#    to_port = 443
#    protocol = "tcp"
#    cidr_blocks = ["${var.Trusted-CIDR}"]
#  }
#  ingress {
#    from_port = 8089
#    to_port = 8089
#    protocol = "tcp"
#    cidr_blocks = ["${var.VPC-Subnet}"]
#  }
#  ingress {
#    from_port = 9997
#    to_port = 9997
#    protocol = "tcp"
#    cidr_blocks = ["${var.VPC-Subnet}"]
#  }
#
#  # Outbound Access
#  egress {
#    from_port = 20
#    to_port = 21
#    protocol = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#  egress {
#    from_port = 22
#    to_port = 22
#    protocol = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#  egress {
#    from_port = 53
#    to_port = 53
#    protocol = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#  egress {
#    from_port = 53
#    to_port = 53
#    protocol = "udp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#  egress {
#    from_port = 80
#    to_port = 80
#    protocol = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#  egress {
#    from_port = 443
#    to_port = 443
#    protocol = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#}

##########################
# All Open
resource "aws_security_group" "sg_all_open" {
  name        = "sg_all_open"
  description = "Allows everything."
  vpc_id      = "${aws_vpc.vpc_primary.id}"

  # SSH for management from me
  ingress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound Access
  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}


