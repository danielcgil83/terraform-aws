# receive from aws the most recent informations about ubuntu ami
data "aws_ami" "ubuntu" {
  owners      = ["amazon"]
  most_recent = true
  name_regex  = "ubuntu"

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}


# resource block sets the configurations of the resources will be created, modified or destroyed
resource "aws_instance" "this" {
  # for each environment it'll create a different resource type with different names
  for_each = {
    "web" = {
      name = "Web Server"
      type = "t3.medium"
    }
    "ci_cd" = {
      name = "CI/CD Server"
      type = "t3.micro"
    }
  }
  ami           = data.aws_ami.ubuntu.id
  instance_type = lookup(each.value, "type", null)

  tags = {
    Name       = "${each.key}: ${lookup(each.value, "name", null)}"
    Owner      = "Daniel Gil"
    Project    = "Learning Test"
    Managed-by = "Terraform"
  }
}