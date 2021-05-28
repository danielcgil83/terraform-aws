# setting all the variables for this directory
variable "aws_region" {
  type        = string
  description = ""
  default     = "us-east-1"
}


variable "aws_profile" {
  type        = string
  description = ""
  default     = "terraform"
}


variable "env" {}


variable "instance_ami" {
  type        = string
  description = ""
  default     = "ami-0d5eff06f840b45e9"

  # check if the value of instace ami is valid, the condition is to be longer than 4 characters and start with "ami-"
  validation {
    condition     = length(var.instance_ami) > 4 && substr(var.instance_ami, 0, 4) == "ami-"
    error_message = "The instance_ami value must be a valid ami ID, starting with \"ami-\"."
  }
}


# create a kind of dictionary with key and value
variable "instance_number" {
  # key type
  type = object({
    dev  = number
    prod = number
  })
  description = "Number of instances to create"
  # key value
  default = {
    dev  = 1
    prod = 3
  }
}

# create a kind of dictionary with key and value
variable "instance_type" {
  # key type
  type = object({
    dev  = string
    prod = string
  })
  description = ""
  # key value
  default = {
    dev  = "t2.micro"
    prod = "t2.small"
  }
}