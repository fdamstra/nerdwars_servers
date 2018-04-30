{% import 'variables.include' as var %}
# User Settings
# -------------
# These MUST be configured
variable "AWS-Key-Pair-Name" {
  description = "Name of the keypair in AWS"
  type = "string"
  default = "{{ var.AWS_Key_Pair_Name }}"
}

variable "Private-Key-File" {
  description = "The name of the file containing your private key"
  type = "string"
  default = "{{ var.Private_Key_File }}"
}

variable "Domain-Name" {
  description = "Your domain name (hosted in Route53)"
  type = "string"
  default = "{{ var.Domain_Name }}"
}

variable "Domain-Zone-ID" {
  description = "The Zone ID of the Domain-Name in Route53"
  type = "string"
  default = "{{ var.Domain_Zone_ID }}"
}

variable "Trusted-CIDR" {
  description = "Trusted source addresses in CIDR notation."
  type = "list"
  default =  {{ var.Trusted_CIDR }}
}

# Common Settings
# ---------------
# You may wish to customize these, but defaults
# will usually work.
variable "region" {
  description = "Which AWS region do you wish to deploy to?"
  type = "string"
  default = "{{ var.AWS_Region }}"
}

variable "VPC-Subnet" {
  description = "The full subnet for your VPC (to be split into 2 subnets)"
  type = "string"
  default = "10.66.0.0/16"
}

variable "Nerdwars-Subnet" {
  description = "The CIDR for the Honeypot subnet. Must be a subnet of VPC-Subnet"
  type = "string"
  default = "10.66.0.0/24"
}

# --------------------
# Defaults are probably fine, but if you want to change
# your performance, here's where you can tune.
#
# Recommendations from NS2:
# 	2GB RAM
# 	Faster Clock Speed
# 		3.0GHz for 12 players
# 		3.6GHz for 16 players
#
# t2.medium : $0.0464/hr - 2vCPU variable ECU, 4GB
# m5.large  ; $0.096/hr  - 2vCPU 10 ECU, 8GB
# c5.large  : $0.085/hr -  2vCPU 8 ECO, 4GB
variable "Nerdwars-Linux-Instance-Type" {
  description = "What size instances do you want to deploy?"
  type = "string"
  default = "c5.large"
}

variable "EBS-Optimized" {
  description = "Should instances be deployed as EBS optimized?"
  type = "string"
  default = false
}

variable "Nerdwars-Linux-Volume-Size" {
  description = "How much swap do you need?"
  type = "string"
  default = 10
}

variable "Swap-Volume-Size" {
  description = "How much swap do you need?"
  type = "string"
  default = 2
}

variable "Swap-Volume-Type" {
  description = "Type of storage for the swap volume."
  type = "string"
  default = "gp2"
}

variable "Default-Volume-Type" {
  description = "Type of storage for the default volumes."
  type = "string"
  default = "gp2"
}


