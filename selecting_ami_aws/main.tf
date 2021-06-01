# in this case terraform block is used to guarantee the right version to be used if this code has been used again
terraform {
  required_version = "0.15.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.42.0"
    }
  }
}

# provider block is used to set the cloud provider, the region and the profile on aws cli (in case of this last one exists)
provider "aws" {
  region  = "us-east-1"
  profile = "terraform"
}

# receive from aws the most recent informations about amazon ami
data "aws_ami" "this" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

# exposes all the information about the resource found in the last block
output "ami" {
  value = data.aws_ami.this
}