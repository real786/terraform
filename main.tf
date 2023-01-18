provider "aws" {

  region = "${var.aws_region}"

}

resource "aws_s3_bucket" "public-bucket" {
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
