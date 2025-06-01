# terraform/main.tf

provider "aws" {
  region = var.ct_home_region
  assume_role {
    role_arn = var.aft_admin_role_arn
    session_name = "AFT-Account-Request"
  }
}

terraform {
  required_version = "~> 1.3.0"  # This allows any 1.3.x version
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0"
    }
  }
}

# Include account requests
locals {
  account_request_files = fileset("${path.module}/accounts", "*.tf")
}

# Optional: Metadata tracking
resource "aws_dynamodb_table_item" "account_request_metadata" {
  table_name = var.account_request_table_name
  hash_key   = "id"

  item = jsonencode({
    id = { S = "latest" }
    last_updated = { S = timestamp() }
    account_files = { S = jsonencode(local.account_request_files) }
  })
}
