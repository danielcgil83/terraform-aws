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
  region  = var.aws_region
  profile = var.aws_profile
}


# block that generates random pet names that are intended to be used as unique identifiers for other resources
resource "random_pet" "this" {
  length = 5
}


# this block calls the content of a module called "bucket"
module "bucket" {
  source = "./s3"
  name   = random_pet.this.id

  versioning = {
    enabled = true
  }
}


# block that generates random pet names that are intended to be used as unique identifiers for other resources
resource "random_pet" "website" {
  length = 5
}


# this block calls the content of a module called "website"
module "website" {
  source = "./s3"
  name   = random_pet.website.id
  files  = "${path.root}/website"
  acl    = "public-read"
  website = {
    index_document = "index.html"
    error_document = "error.html"
  }
  policy = <<EOT
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::${random_pet.website.id}/*"
            ]
        }
    ]
}
EOT
}