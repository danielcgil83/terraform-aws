# a simple way to return information in CLI when running a terraform command
output "file" {
  value = "${var.bucket}.${aws_s3_bucket_object.this.key}"
}


output "object_etag" {
  value = aws_s3_bucket_object.this.etag
}


output "object_cointent_type" {
  value = aws_s3_bucket_object.this.content_type
}


output "object_meta" {
  value = aws_s3_bucket_object.this.metadata
}