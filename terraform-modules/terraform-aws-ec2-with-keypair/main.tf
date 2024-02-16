provider "aws" {
  region = "ap-south-2"
}

module "ec2_instance" {
  source = "./modules/ec2-instance"
  ami_value = "ami-0e772b315cdd7abe2"
  instance_type = "t3.micro"
  key_name_value = "hyd_key"
}