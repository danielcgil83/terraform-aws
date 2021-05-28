# create a random sequence of words
resource "random_pet" "bucket" {
    length = 5
}


# create the s3 bucket using the sequence of words plus "-" and the environment abreviation
resource "aws_s3_bucket" "this" {
  bucket = "${random_pet.bucket.id}-${var.env}"

  tags = local.common_tags
}


# upload an object to s3 bucket
resource "aws_s3_bucket_object" "this" {
  bucket = aws_s3_bucket.this.bucket
  # create a key value with uuid(unique universal identificator) plus the extension "zip"
  key    = "${uuid()}.${local.file_ext}"
  source = data.archive_file.json.output_path
  # a resource to store its state for further atualizations
  etag = filemd5(data.archive_file.json.output_path)
  content_type = "application/zip"

  tags = local.common_tags
}