# terraform/variables.tf

variable "ct_home_region" {
  type        = string
  description = "Control Tower home region"
  default     = "us-east-1"
}

variable "aft_admin_role_arn" {
  type        = string
  description = "AFT Admin Role ARN"
  default = "arn:aws:ssm:us-east-1:746120363643:parameter/aft/config/aft-role-arn"
}

variable "account_request_table_name" {
  type        = string
  description = "DynamoDB table for account requests"
  default     = "aft-request-metadata"
}
