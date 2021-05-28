# block that generates random pet names that are intended to be used as unique identifiers for other resources
resource "random_pet" "bucket" {
  length = 5
}