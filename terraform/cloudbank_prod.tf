resource "aws_s3_bucket" "backup-prod-data" {
  region = "us-east-1"
  bucket = "readable"
  acl    = "public-read-write"

  logging {
    target_bucket = aws_s3_bucket.log_bucket.id
    target_prefix = "log/"
  }

  versioning {
    enabled = true
  }

  tags = {
    Environment = "Prod"
    Logging     = "Prod"
  }
}

resource "aws_s3_bucket_public_access_block" "public" {
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}