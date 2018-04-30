{% import 'variables.include' as var %}
##########
# Network ACLs enforce the basic rules of the topology, and are
# further refined by security groups on instances.
#
# Topology has two "public" subnets (in different AZs) for 
# servers such as searchheads and HECs that are accessible publicly.
#
# It was two "private" subnets (in different AZs) for
# servers such as indexers that aren't publicly available.
#
# The two AZ's can talk to each other.
# The public subnets can be accessed by any service/source
#   allowed by the security group.
# The private subnets are only accessible by the public
#   subnets, and port 22 from anywhere.
#
# Network ACLs allow all outbound. This should be restricted
# via security groups to only those ports needed.
resource "aws_network_acl" "acl_public" {
    vpc_id = "${aws_vpc.vpc_primary.id}"
    subnet_ids = ["${aws_subnet.subnet_Nerdwars.id}"]
    egress {
        protocol = "-1"
        rule_no = 10
        action = "allow"
        cidr_block =  "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }

    ingress {
        protocol = "-1"
        rule_no = 10
        action = "allow"
        cidr_block =  "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }

    tags {
        Name = "Public Subnets"
    }
}

#resource "aws_network_acl" "acl_private" {
#    vpc_id = "${aws_vpc.vpc_primary.id}"
#    subnet_ids = ["${aws_subnet.subnet_private_a.id}", "${aws_subnet.subnet_private_b.id}"]
#    egress {
#        protocol = "-1"
#        rule_no = 10
#        action = "allow"
#        cidr_block =  "0.0.0.0/0"
#        from_port = 0
#        to_port = 0
#    }
#
#    ingress {
#        protocol = "-1"
#        rule_no = 10
#        action = "allow"
#        cidr_block =  "${var.VPC-Subnet}"
#        from_port = 0
#        to_port = 0
#    }
#
#    ingress {
#        protocol = "icmp"
#        rule_no = 20
#        action = "allow"
#        cidr_block =  "0.0.0.0/0"
#        icmp_type = 8
#        from_port = 0
#        to_port = 0
#    }
#
#    ingress {
#        protocol = "tcp"
#        rule_no = 30
#        action = "allow"
#        cidr_block =  "0.0.0.0/0"
#        from_port = 22
#        to_port = 22
#    }
#
#    tags {
#        Name = "Private Subnets"
#    }
#}
#
