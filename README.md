# terraform-aws-identitystore
This module handles creation of AWS SSO identity groups and users

## Usage

```hcl
module "aws_identitystore" {
  source = "git::https://github.com/avlcloudtechnologies/terraform-aws-config.git?ref=v0.1.0

  sso_groups = {
    admins = {
      description = "Group with Administrator access to all accounts excluding Management account"
    },
    developers = {
      description = "Group for developers"
    }

  sso_users = {
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
      sso_groups   = ["developers"]
    }
  }
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.33 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.33 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_identitystore_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/identitystore_group) | resource |
| [aws_identitystore_group_membership.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/identitystore_group_membership) | resource |
| [aws_identitystore_user.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/identitystore_user) | resource |
| [aws_ssoadmin_instances.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssoadmin_instances) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_sso_groups"></a> [sso\_groups](#input\_sso\_groups) | A map of AWS SSO groups | <pre>map(object({<br>    description = optional(string)<br>  }))</pre> | n/a | yes |
| <a name="input_sso_users"></a> [sso\_users](#input\_sso\_users) | A map of AWS SSO users | <pre>map(object({<br>    display_name       = string<br>    given_name         = string<br>    family_name        = string<br>    sso_groups         = list(string)<br>    locale             = optional(string)<br>    nickname           = optional(string)<br>    preferred_language = optional(string)<br>    profile_url        = optional(string)<br>    timezone           = optional(string)<br>    title              = optional(string)<br>    user_type          = optional(string)<br>    emails = optional(list(object({<br>      value   = optional(string)<br>      primary = optional(bool, true)<br>      type    = optional(string)<br>    })), []),<br>    addresses = optional(list(object({<br>      country        = optional(string)<br>      formatted      = optional(string)<br>      locality       = optional(string)<br>      postal_code    = optional(string)<br>      primary        = optional(bool, true)<br>      region         = optional(string)<br>      street_address = optional(string)<br>      type           = optional(string)<br>    })), []),<br>    phone_numbers = optional(list(object({<br>      value   = optional(string)<br>      primary = optional(bool, true)<br>      type    = optional(string)<br>    })), [])<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_groups"></a> [groups](#output\_groups) | All attributes of the newly created AWS SSO groups in the identity store. |
| <a name="output_users"></a> [users](#output\_users) | All attributes of the newly created AWS SSO users in the identity store. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->