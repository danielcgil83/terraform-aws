# in this case terraform block is used to guarantee the right version to be used if this code has been used again
terraform {
  required_version = "0.15.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.42.0"
    }
  }

  backend "s3" {
    bucket  = "tfstate-971634117268"
    key     = "dev/data-sources-and-outputs/terraform.tfstate"
    region  = "us-east-1" # terraform block is the first to be executed, so it isn't possible to use variables in it
    profile = "terraform" # terraform block is the first to be executed, so it isn't possible to use variables in it
  }
}


# provider block is used to set the cloud provider, the region and the profile on aws cli (in case of this last one exists)
provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}