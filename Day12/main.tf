provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "nautilus_s3_15530" {
  bucket = "nautilus-s3-15530"

  tags = {
    Name = "nautilus-s3-15530"
  }
}

resource "aws_s3_bucket_public_access_block" "nautilus_s3_15530" {
  bucket = aws_s3_bucket.nautilus_s3_15530.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "nautilus_s3_15530" {
  depends_on = [
    aws_s3_bucket_public_access_block.nautilus_s3_15530
  ]

  bucket = aws_s3_bucket.nautilus_s3_15530.id
  acl    = "public-read"
}
