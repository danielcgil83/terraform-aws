# resource block sets the configurations of the resources will be created, modified or destroyed
resource "aws_instance" "web" {
  ami           = var.instance_ami
  instance_type = var.instance_type

  tags = {
    Name       = "Remote State"
    Owner      = "Daniel Gil"
    Managed-by = "Terraform"
    Project    = "Learning Test"
    Created-at = "2021-05-28"
  }
}