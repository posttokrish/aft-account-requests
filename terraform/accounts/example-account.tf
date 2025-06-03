module "example_dev_account" {
  source = "github.com/aws-ia/terraform-aws-control_tower_account_factory?ref=v1.10.1//modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail = "example+hkrigana@amazon.com"
    AccountName  = "example-account"
    ManagedOrganizationalUnit = "gss-Sandbox"
    SSOUserEmail     = "admin+hkrigana@amazon.com"
    SSOUserFirstName = "Krishna"
    SSOUserLastName  = "GGGG"
  }

  account_tags = {
    Environment = "Development"
    Owner       = "TeamA"
    CostCenter  = "123456"
  }

  custom_fields = {
    project     = "example"
    department  = "engineering"
  }
}
