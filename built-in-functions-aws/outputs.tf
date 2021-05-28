output "instance_public_ips" {
  # return the public ip for each instance created
  value = aws_instance.server.*.public_ip
}

output "instance_names" {
  # return the name for each instance created
  value = join(", ", aws_instance.server.*.tags.Name)
}