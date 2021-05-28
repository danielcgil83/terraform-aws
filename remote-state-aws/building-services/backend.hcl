bucket = "tfstate-971634117268"
key    = "dev/remote-state/terraform.tfstate"
region = "us-east-1"  # terraform block is the first to be executed, so it isn't possible to use variables in it
profile = "terraform"  # terraform block is the first to be executed, so it isn't possible to use variables in it