provider "aws" {
  region = "ap-south-2"
}

resource "aws_instance" "hyd_web_srv" {
  ami = var.ami_value
  instance_type = var.instance_type
  key_name = var.key_name_value
}