module "example_test_account" {
  source = "github.com/aws-ia/terraform-aws-control_tower_account_factory?ref=v1.10.1//modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail = "example2+hkrigana@amazon.com"
    AccountName  = "example2-account"
    ManagedOrganizationalUnit = "gss-Sandbox"
    SSOUserEmail     = "admin2+hkrigana@amazon.com"
    SSOUserFirstName = "Krishna2"
    SSOUserLastName  = "GGGG2"
  }

  account_tags = {
    Environment = "Development"
    Owner       = "TeamA"
    CostCenter  = "123456"
  }

}
