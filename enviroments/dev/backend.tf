terraform {
  backend "s3" {
    bucket         = "netflix-terraform-state-vv"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}