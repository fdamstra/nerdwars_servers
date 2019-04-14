terraform {
  backend "s3" {
    bucket = "monkeybox-terraform-state" 
    key    = "us-east-2/nerdwars_server/nerdwars.tfstate"
    region = "us-east-2"
    encrypt = true
  }
}
