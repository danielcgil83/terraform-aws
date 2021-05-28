locals {
  # look for the number of instances for each kind of environment
  instance_number = lookup(var.instance_number, var.env)

  file_ext = "zip"

  object_name = "my_file_from_template"

  common_tags = {
    Owner = "Daniel Gil"
    Year  = "2021"
  }
}