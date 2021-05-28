# when some local values appears several times, they can be storaged in this file to make easier its usage
locals {
  text_file = "texto_exemplo.txt"

  common_tags = {
    Owner       = "Daniel Gil"
    Environment = var.environment
    Managed-by  = "Terraform"
    Project     = "Learning Test"
  }
}