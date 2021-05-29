# allow reading the state of the bucket were the state is stored
data "terraform_remote_state" "server" {
  backend = "s3"

  config = {
    bucket  = "tfstate-971634117268"
    key     = "dev/data-sources-and-outputs/terraform.tfstate"
    region  = var.aws_region
    profile = var.aws_profile
  }
}