output "vpc_id" {
    value = aws_vpc.terratest_vpc.id
}

output "subnet_id" {
    value = aws_subnet.sample_subnet.id
}

output "instance_id" {
    value = aws_instance.web.id
}

output "aws_efs" {
    value = aws_efs_file_system.sample_efs.id
}

output "aws_efs_mount" {
    value = aws_efs_mount_target.sample_efs_mount.id
}