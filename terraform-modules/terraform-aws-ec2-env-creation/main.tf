provider "aws" {
  region = "ap-south-2"
}

module "ec2_instance" {
  source = "./modules/ec2-instance"
  ami_value = "ami-0bbc2f7f6287d5ca6"
  instance_type_value = "t3.micro"
  availability_zone_value = "ap-south-2b"
  key_name_value = "hyd_key"
}