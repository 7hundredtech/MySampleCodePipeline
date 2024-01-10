output "ec2_instance_public_dns" {
  value = aws_instance.my_ec2_instance.public_dns
}