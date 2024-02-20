provider "aws" {
  region = "ap-south-1"
}

resource "aws_key_pair" "hyd_keypair" {
  key_name = "hyd_keypair"
  public_key = file("~/.ssh/hyd_keypair.pub")
}

resource "aws_instance" "apache2" {
  ami = var.ami_value
  instance_type = var.instance_type_value
  availability_zone = var.availability_zone_value
  key_name = aws_key_pair.hyd_keypair.key_name
  user_data = "${file("install-apache2.sh")}"

  # user_data = <<-EOF
  #   #! /bin/bash
  #   sudo apt-get update
  #   echo "**  Installing apach2  **"
  #   sudo apt install -y apache2
  #   sudo systemctl start apache2
  #   sudo systemctl enable apache2
  #   echo "<h1> Apache installed with the help of user_data by Vinay Maddela </h1>| sudo tee /var/www/html/index.html"
  #   EOF
}