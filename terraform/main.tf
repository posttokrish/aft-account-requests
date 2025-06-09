module "sandbox-7" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail = "example7+hkrigana@amazon.com"
    AccountName  = "example7-account"
    ManagedOrganizationalUnit = "gss-Sandbox"
    SSOUserEmail     = "admin7+hkrigana@amazon.com"
    SSOUserFirstName = "Krishna7"
    SSOUserLastName  = "GGGG7"
  }
  account_tags = {
    "Learn Tutorial" = "AFT2"
  }

  change_management_parameters = {
    change_requested_by = "HashiCorp Learn"
    change_reason       = "Learn AWS Control Tower Account Factory for Terraform"
  }

  custom_fields = {
    group = "non-prod"
  }

  account_customizations_name = "SANDBOX"
}
