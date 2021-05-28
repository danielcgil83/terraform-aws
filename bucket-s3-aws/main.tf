# in this case terraform block is used to guarantee the right version to be used if this code has been used again
terraform {
  required_version = "0.15.4"

  required_providers {
    aws = {
      source  = "registry.terraform.io/hashicorp/aws"
      version = "3.42.0"
    }
  }
}


# provider block is used to set the cloud provider, the region and the profile on aws cli (in case of this last one exists)
provider "aws" {
  region  = "us-east-1"
  profile = "terraform"
}

# resource block sets the configurations of the resources will be created, modified or destroyed
resource "aws_s3_bucket" "name-of-bucket-for-terraform" {
  bucket = "name-of-bucket-in-aws" # must be unique
  acl    = "private"

  tags = {
    name = "value" # you can create as much tags as you want
  }
}