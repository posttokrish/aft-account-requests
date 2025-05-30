# terraform/main.tf

# Provider configuration
provider "aws" {
  region = "us-east-1"  # or your preferred region
  assume_role {
    role_arn = "arn:aws:iam::${var.aft_management_account_id}:role/AWSAFTAdmin"
  }
}

# Terraform configuration
terraform {
  required_version = ">= 0.15.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0"
    }
  }
  
  # Optional: Backend configuration if you want to store state
  backend "s3" {
    bucket         = "aft-backend-746120363643-primary-region"
    key            = "aft-account-requests/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}

# Module for account requests
# This is where you can define common variables or settings for all account requests

locals {
  common_tags = {
    managed_by = "AFT"
    aft_version = "1.0.0"
    terraform_managed = "true"
  }
}

# Example of a data source to get organizational units
data "aws_organizations_organization" "current" {}

data "aws_organizations_organizational_units" "all" {
  parent_id = data.aws_organizations_organization.current.roots[0].id
}


# Include all account requests from the accounts directory
# This automatically includes all .tf files in the accounts directory
locals {
  account_request_files = fileset("${path.module}/accounts", "*.tf")
}


