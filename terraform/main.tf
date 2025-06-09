module "sandbox-10" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail = "example10+hkrigana@amazon.com"
    AccountName  = "example10-account"
    ManagedOrganizationalUnit = "gss-Sandbox"
    SSOUserEmail     = "admin10+hkrigana@amazon.com"
    SSOUserFirstName = "Krishna10"
    SSOUserLastName  = "GGGG-10"
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
