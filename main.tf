resource "aws_efs_file_system" "sample_efs" {
  creation_token = "my-terratest"

  tags = {
    Name = "TERRATEST"
  }
}

resource "aws_efs_mount_target" "sample_efs_mount" {
  file_system_id = aws_efs_file_system.sample_efs.id
  subnet_id      = aws_subnet.sample_subnet.id
}

resource "aws_vpc" "terratest_vpc" {
  cidr_block = var.main_vpc_cidr
}

resource "aws_subnet" "sample_subnet" {
  vpc_id            = aws_vpc.terratest_vpc.id
  availability_zone = var.availability_zone
  cidr_block        = var.subnet_cidr
}

resource "aws_instance" "web" {
ami           = "ami-083654bd07b5da81d"
instance_type = "t2.micro"
tags = {
Name = "WEB"
 }
provisioner "local-exec" {
command = "echo ${aws_instance.web.public_ip} > publicIP.txt"
  }
}
