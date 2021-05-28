# setting all the variables for main.tf

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


variable "instance_ami" {
  type        = string
  description = ""
  default     = "ami-0d5eff06f840b45e9"
}


variable "instance_type" {
  type        = string
  description = ""
  default     = "t2.micro"
}


# in this case the type of variable is a map of strings, in this way it'll take all tag names and tag values
variable "instance_tags" {
  type        = map(string)
  description = ""
  default = {
    Name       = "Ubuntu"
    Managed-by = "Terraform"
    Project    = "Learning Test"
  }
}