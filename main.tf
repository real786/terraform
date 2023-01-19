provider "aws" {

  region = "${var.aws_region}"

}

resource "aws_s3_bucket" "onebucket" {
  bucket = "01111202023"
  acl    = "public-read"
  versioning {
    enabled = false
  }
}

