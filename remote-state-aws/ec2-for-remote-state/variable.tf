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


