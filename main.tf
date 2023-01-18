provider "aws" {

  region = "${var.aws_region}"

}

resource "aws_s3_bucket" "onebucket" {
  bucket = "terraform-bucket"
  acl    = "public-read"
  versioning {
    enabled = false
  }
  tags = {
    Name        = "s3"
    Environment = "aws"
    Owner       = "real786"

  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
resource "aws_s3_bucket_public_access_block" "artifacts" {
  bucket = aws_s3_bucket.onebucket.id

  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true

}
