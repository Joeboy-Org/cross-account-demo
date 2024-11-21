terraform {
  backend "s3" {
    bucket         = "cross-account-mgmt-bucket"
    key            = "Cross-Account-Demo/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "cross-account-mgmt-table"
    encrypt        = true
  }
}