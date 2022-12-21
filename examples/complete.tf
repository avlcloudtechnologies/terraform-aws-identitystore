module "aws_identitystore" {
  source = "git::https://github.com/avlcloudtechnologies/terraform-aws-config.git?ref=v0.1.0"

  sso_groups = {
    admins = {
      description = "Group with Administrator access to all accounts excluding Management account"
    },
    developers = {
      description = "Group for developers"
    },
  }
  sso_users = {
    aurimas = {
      display_name       = "Aurimas Mickevicius"
      given_name         = "Aurimas"
      family_name        = "Mickevicius"
      sso_groups         = ["admins", "developers"]
      locale             = "My Locale"
      nickname           = "auri"
      preferred_language = "English"
      profile_url        = "https://myurl.com"
      timezone           = "UTC"
      title              = "Mr"
      user_type          = "My User type"
      emails = [
        {
          value   = "aurimas@avlcloudtechnologies.com"
          primary = true
          type    = "work"
        },
      ]
      addresses = [
        {
          country        = "United Kingdom"
          formatted      = "Formatted address"
          locality       = "UK"
          postal_code    = "AB12CD"
          primary        = true
          region         = "Europe"
          street_address = "Bond St."
          type           = "work"
        },
      ]
      phone_numbers = [
        {
          value   = "0123456789"
          primary = true
          type    = "work"
        },
      ]
    },
    jane = {
      display_name = "Jane Doe"
      given_name   = "Jane"
      family_name  = "Doe"
      sso_groups   = ["admins"]
    },
    john = {
      display_name = "John Doe"
      given_name   = "John"
      family_name  = "Doe"
      sso_groups   = ["admins"]
    }
  }
}