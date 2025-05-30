provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn = "arn:aws:iam::${var.aft_management_account_id}:role/AWSAFTAdmin"
  }
}
