{% import 'variables.include' as var %}

###########
# Create a VPC with an Internet gateway for everybody to play in
resource "aws_vpc" "vpc_primary" {
  cidr_block = "${var.VPC-Subnet}"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags {
    Name = "Primary VPC"
  }
}
resource "aws_internet_gateway" "gw_primary" {
  vpc_id = "${aws_vpc.vpc_primary.id}"
  tags {
    Name = "Primary Gateway"
  }
}

###########
# Create honeypot and splunk subnets in an AZ
data "aws_availability_zones" "available" {}

resource "aws_subnet" "subnet_Nerdwars" {
  vpc_id = "${aws_vpc.vpc_primary.id}"
  cidr_block = "${var.Nerdwars-Subnet}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  map_public_ip_on_launch = true
  tags {
    Name = "HoneyPot"
  }
}

##########
# Routing
resource "aws_route_table" "r" {
    vpc_id = "${aws_vpc.vpc_primary.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw_primary.id}"
    }
  tags {
    Name = "Primary Route Table"
  }
}
resource "aws_route_table_association" "rt_public_a" {
  subnet_id = "${aws_subnet.subnet_Nerdwars.id}"
  route_table_id = "${aws_route_table.r.id}"
}
#resource "aws_route_table_association" "rt_public_b" {
#  subnet_id = "${aws_subnet.subnet_Splunk.id}"
#  route_table_id = "${aws_route_table.r.id}"
#}
#resource "aws_route_table_association" "rt_private_a" {
#  subnet_id = "${aws_subnet.subnet_private_a.id}"
#  route_table_id = "${aws_route_table.r.id}"
#}
#resource "aws_route_table_association" "rt_private_b" {
#  subnet_id = "${aws_subnet.subnet_private_b.id}"
#  route_table_id = "${aws_route_table.r.id}"
#}
