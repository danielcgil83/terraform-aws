terraform {
  required_version = "0.15.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.42.0"
    }
  }
}


provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}