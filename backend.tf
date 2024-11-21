terraform {
  backend "s3" {
    bucket         = "cross-account-mgmt-bucket"
    key            = "Cross-Account-Demo/terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "cross-account-mgmt-table"
    encrypt        = true
  }
}