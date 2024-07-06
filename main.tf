provider "aws" {
  region = "ap-south-1" # Change to your desired AWS region
}

resource "aws_s3_bucket" "example" {
  bucket = "praneeth010101010" # Change to a unique bucket name
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
resource "aws_s3_bucket" "example" {
  bucket = "praneeth0101013310" # Change to a unique bucket name
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
