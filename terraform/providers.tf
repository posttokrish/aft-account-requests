provider "aws" {
  alias  = "aft_management"  # Add this line
  region = "us-east-1"
  assume_role {
    role_arn = "arn:aws:iam::746120363643:role/AWSAFTAdmin"
  }
}
