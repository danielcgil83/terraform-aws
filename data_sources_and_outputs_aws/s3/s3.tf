# block that generates random pet names that are intended to be used as unique identifiers for other resources
resource "random_pet" "this" {
  length = 5
}


# create a new bucket in aws with the string "my-bucket-" plus a random name
resource "aws_s3_bucket" "this" {
  bucket = "my-bucket-${random_pet.this.id}"
}


# create an object to store the outputs file of ec2 implementation
resource "aws_s3_bucket_object" "this" {
  bucket       = aws_s3_bucket.this.id
  key          = "data-source-test/instance-${local.instance.ami}.json"
  source       = "outputs.json"
  etag         = filemd5("outputs.json")
  content_type = "application/json"
}