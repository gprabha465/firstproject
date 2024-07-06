provider "aws" {
  region = "ap-south-1" # Change to your desired AWS region
}

resource "aws_s3_bucket" "first_bucket" {
  bucket = "praneeth010101010" # Change to a unique bucket name
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
resource "aws_s3_bucket" "second_bucket" {
  bucket = "praneeth0101011310" # Change to a unique bucket name
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
