provider "aws" {
  region = "ap-south-2"
}

resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr_block

  tags = {
    Name = "hyd_vpc"
  }
}

resource "aws_subnet" "sub1" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-south-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "hyd_subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "hyd_igw"
  }
}

resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "hyd_rt"
  }
}

resource "aws_route_table_association" "rta1" {
  subnet_id = aws_subnet.sub1.id
  route_table_id = aws_route_table.RT.id
}

resource "aws_security_group" "hyd_sg" {
  name = "hyd_web"
  vpc_id = aws_vpc.myvpc.id

  ingress {
    description = "HTTP"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["49.204.19.199/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "hyd_web_sg"
  }
}

resource "aws_instance" "hyd_web_srv" {
  ami = var.ami_value
  instance_type = var.instance_type_value
  availability_zone = var.availability_zone_value
  subnet_id = aws_subnet.sub1.id
  key_name = var.key_name_value
}