# a simple way to return information in CLI when running a terraform command
output "bucket_name" {
  value = aws_s3_bucket.this.bucket
}


output "bucket_arn" {
  value       = aws_s3_bucket.this.arn
  description = ""
}


output "bucket_domain_name" {
  value = aws_s3_bucket.this.bucket_domain_name
}


output "text_file_path" {
  value = "${aws_s3_bucket.this.bucket}/${aws_s3_bucket_object.this.key}"
}