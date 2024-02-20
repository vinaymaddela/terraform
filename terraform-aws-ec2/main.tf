provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web-vm" {
  ami = var.ami_value
  instance_type = var.instance_type_value
  availability_zone = var.availability_zone_value
}