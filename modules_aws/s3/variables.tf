# setting all the variables for this directory
variable "name" {
  type        = string
  description = "Bucket Name"
}


variable "acl" {
  type        = string
  description = ""
  default     = "private"
}


variable "policy" {
  type        = string
  description = ""
  default     = null
}


variable "tags" {
  type        = map(string)
  description = ""
  default     = {}
}


variable "key_prefix" {
  type    = string
  default = ""
}


variable "files" {
  type    = string
  default = ""
}


variable "website" {
  type        = map(string)
  description = "Map containning website configuration"
  default = {

  }
}


variable "versioning" {
  type        = map(string)
  description = "Map containning website configuration"
  default = {

  }
}