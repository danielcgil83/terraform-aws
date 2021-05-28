# create a new bucket in aws with a random name
resource "aws_s3_bucket" "this" {
  bucket = "${random_pet.bucket.id}-${var.environment}"

  tags = local.common_tags
}


# upload a file to aws bucket previously created and store its state for further atualizations
resource "aws_s3_bucket_object" "this" {
  bucket       = aws_s3_bucket.this.bucket
  key          = "text_files/${local.text_file}"
  source       = local.text_file
  etag         = filemd5(local.text_file)
  content_type = "text/plain"

  tags = local.common_tags
}

# create a new object in aws bucket based on a local file and naming it with the name of bucket
resource "aws_s3_bucket_object" "random" {
  bucket       = aws_s3_bucket.this.bucket
  key          = "text_files/${random_pet.bucket.id}.txt"
  source       = local.text_file
  etag         = filemd5(local.text_file)
  content_type = "text/plain"

  tags = local.common_tags
}