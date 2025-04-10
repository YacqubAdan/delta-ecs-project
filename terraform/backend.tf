terraform {
  backend "s3" {
    bucket         = "delta-backend-tf"
    key            = "terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "delta-backend-db"
    encrypt        = true
  }
}