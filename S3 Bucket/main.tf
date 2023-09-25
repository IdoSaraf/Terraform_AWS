

resource "aws_s3_bucket" "newbucket"{
    bucket = var.s3_bucket_name
}


output show_bucket_name {
  value       = [aws_s3_bucket.newbucket.bucket]

}
