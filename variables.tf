variable "main_vpc_cidr" {
    type = string
}

variable "availability_zone" {
    type = string
    default = "us-east-1a"
}

variable "subnet_cidr" {
    type = string
}

variable "aws_region" {
  type = string
}