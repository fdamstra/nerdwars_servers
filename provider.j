{% import 'variables.include' as var %}

# Set a provider for the region
provider "aws" {
# Specify keys if not provided by shared crednentials file
#  access_key = "${var.access_key}"
#  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

