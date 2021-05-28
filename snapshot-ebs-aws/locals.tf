# when some local values appears several times, they can be storaged in this file to make easier its usage
locals {
  common_tags = {
    Name       = "Snapshot EBS Ubuntu"
    Ownes      = "Daniel Gil"
    Managed-by = "Terraform"
    Project    = "Learning Test"
  }
}