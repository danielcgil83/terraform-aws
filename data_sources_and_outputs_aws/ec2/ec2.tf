# resource block sets the configurations of the resources will be created, modified or destroyed
resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name       = "EC2 for Data Source Test"
    Owner      = "Daniel Gil"
    Managed-by = "Terraform"
    Project    = "Learning Test"
    Created-at = "2021-05-28"
  }
}