variable "ami_value" {
  description = "value of ami"
  type = string
  default = "ami-0bbc2f7f6287d5ca6"
}

variable "instance_type_value" {
  description = "value of instance type"
  type = string
  default = ""  #give instance type value
}

variable "availability_zone_value" {
  description = "value of availability zone"
  type = string
  default = ""  #give availability zone value
}