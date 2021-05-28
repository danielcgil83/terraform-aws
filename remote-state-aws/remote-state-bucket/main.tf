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


# used to get access to aws account ID, user ID and arn
data "aws_caller_identity" "current" {}


resource "aws_s3_bucket" "remote_state" {
  bucket = "tfstate-${data.aws_caller_identity.current.account_id}"

  versioning {
    enabled = true
  }

  tags = {
    Description = "Store Terraform remote state files"
    Owner       = "Daniel Gil"
    Managed-by  = "Terraform"
    Created-at  = "2021-05-28"
  }
}


output "remote_state_bucket" {
  value = aws_s3_bucket.remote_state.bucket
}


output "remote_state_bucket_arn" {
  value = aws_s3_bucket.remote_state.arn
}