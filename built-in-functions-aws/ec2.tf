resource "aws_instance" "server" {
  # conditional, if the instance number is equal to or less than zero, count is set to zero, else receives the instance number
  count = local.instance_number <= 0 ? 0 : local.instance_number
  ami   = var.instance_ami
  # look for the instance type for each kind of environment
  instance_type = lookup(var.instance_type, var.env)

  tags = merge(
    local.common_tags,
    {
      Project = "Learning Test"
      # variable environment formated to string type
      Env = format("%s", var.env)
      # convert "count" to string and join to the string "Instance "
      Name = format("Instance %d", count.index + 1)
    }
  )
}
