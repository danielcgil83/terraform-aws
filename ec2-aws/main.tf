# in this case terraform block is used to guarantee the right version to be used if this code has been used again
terraform {
  required_version = "0.15.4"

  required_providers {
    aws = {
      source = "registry.terraform.io/hashicorp/aws"
      version = "3.42.0"
    }
  }
}


# provider block is used to set the cloud provider, the region and the profile on aws cli (in case of this last one exists)
provider "aws" {
  region  = var.aws_region  # var name pointing to var value in variables.tf
  profile = var.aws_profile  # var name pointing to var value in variables.tf
}

# resource block sets the configurations of the resources will be created, modified or destroyed
resource "aws_instance" "web" {
  ami           = var.instance_ami  # var name pointing to var value in variables.tf
  instance_type = var.instance_type  # var name pointing to var value in variables.tf

  tags = var.instance_tags  # var name pointing to var value in variables.tf
}