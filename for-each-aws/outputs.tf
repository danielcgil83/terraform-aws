output "extensions" {
  value = local.file_extensions
}


output "extensions_upper" {
  value = local.file_extensions_upper
}


# for key and value in aws_instance.this, return the value when key=arn
output "instance_arn" {
  value = [for k, v in aws_instance.this : v.arn]
}


# for key and value in aws_instance.this, return the key tags.Name
output "instance_names" {
  value = { for k, v in aws_instance.this : k => v.tags.Name }
}


# for ip in local.ips, return the private ip
output "private_ips" {
  value = [for ip in local.ips : ip.private]
}


# for ip in local.ips, return the public ip (splat operator)
output "public_ips" {
  value = local.ips[*].public
}