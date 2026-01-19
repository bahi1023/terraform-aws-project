terraform {
  backend "s3" {
    bucket = "your-name-cv-bucket" 
    key    = "day2/terraform.tfstate"
    region = "us-west-1"
  }
  }