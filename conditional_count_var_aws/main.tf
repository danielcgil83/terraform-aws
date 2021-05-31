# in this case terraform block is used to guarantee the right version to be used if this code has been used again
terraform {
    required_version = "0.15.4"

    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "3.42.0"
        }
    }
}

# provider block is used to set the cloud provider, the region and the profile on aws cli (in case of this last one exists)
provider "aws" {
    region = "us-east-1"
    profile = "terraform"
}

# a variable that will be required when run the terraform code, expects "dev" or "prod"
variable "env" {}

resource "aws_instance" "dev" {
    ami = "ami-082b5a644766e0e6f"
    instance_type = "t2.micro"
    # in this case the counter works on a condition, if the var "env" is "dev", count receives 3
    count = var.env == "dev" ? 3 : 0

    tags = {
        # the instance name receives the var and the count index to make the tag value
        Name = "Instance-${var.env}.${count.index + 1}"
    }
}

resource "aws_instance" "prod" {
    ami = "ami-082b5a644766e0e6f"
    instance_type = "t2.large"
    # in this case the counter works on a condition, if the var "env" is "prod", count receives 1
    count = var.env == "prod" ? 1 : 0

    tags = {
        # the instance name receives the var and the count index to make the tag value
        Name = "Instance-${var.env}.${count.index + 1}"
    }
}