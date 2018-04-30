{% import 'variables.include' as var %}

#############
# Search for AMIs for your OS Preference
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}
# Use via: ami = "${data.aws_ami.ubuntu.id}"

data "aws_ami" "centos6" {
  most_recent = true
  owners = ["679593333241"]
  filter {
    name = "name"
    values = ["CentOS Linux 6 x86_64 HVM EBS *"]
  }
}
data "aws_ami" "centos7" {
  most_recent = true
  owners = ["679593333241"]
  filter {
    name = "name"
    values = ["CentOS Linux 7 x86_64 HVM EBS *"]
  }
}

#############
# Old fashioned method, manual mapping:
variable "ubuntu_amis" {
  type = "map"
  default = {
    us-east-1 = "ami-40d28157"
    us-east-2 = "ami-153e6470"
  }
}
# Use with: ami = "${lookup(var.ubuntu_amis, var.region)}"

