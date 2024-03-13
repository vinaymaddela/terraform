provider "aws" {
  region = "ap-south-2"
}

terraform {
  backend "s3" {
    bucket = "terraformrid"
    key = "ridaks/terraform/remote/s3/terraform.tfstate"
    region = "ap-south-2"
  }
}

resource "aws_instance" "dakshi" {
  ami = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "Ec2 Instance with remote state"
  }
}