terraform {
  backend "s3" {
    bucket         = "praneeth-terraform-state"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
  }
}
