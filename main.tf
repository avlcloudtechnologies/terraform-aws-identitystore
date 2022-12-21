data "aws_ssoadmin_instances" "this" {}

locals {
  group_membership = flatten([
    for user_name, user_attr in var.sso_users : [
      for group_name in user_attr.sso_groups : {
        user_name  = user_name
        group_name = group_name
      }
    ]
  ])
}

resource "aws_identitystore_group_membership" "this" {
  for_each = { for pair in local.group_membership : "${pair.user_name}.${pair.group_name}" => pair }

  identity_store_id = tolist(data.aws_ssoadmin_instances.this.identity_store_ids)[0]
  group_id          = aws_identitystore_group.this[each.value.group_name].group_id
  member_id         = aws_identitystore_user.this[each.value.user_name].user_id
}

resource "aws_identitystore_group" "this" {
  for_each = var.sso_groups

  identity_store_id = tolist(data.aws_ssoadmin_instances.this.identity_store_ids)[0]
  display_name      = each.key
  description       = lookup(each.value, "description", null)
}

resource "aws_identitystore_user" "this" {
  for_each = var.sso_users

  identity_store_id = tolist(data.aws_ssoadmin_instances.this.identity_store_ids)[0]
  user_name         = each.key
  display_name      = each.value.display_name

  locale             = lookup(each.value, "locale", null)
  nickname           = lookup(each.value, "nickname", null)
  preferred_language = lookup(each.value, "preferred_language", null)
  profile_url        = lookup(each.value, "profile_url", null)
  timezone           = lookup(each.value, "timezone", null)
  title              = lookup(each.value, "title", null)
  user_type          = lookup(each.value, "user_type", null)

  name {
    given_name       = each.value.given_name
    family_name      = each.value.family_name
    formatted        = lookup(each.value, "formatted", null)
    honorific_prefix = lookup(each.value, "honorific_prefix", null)
    honorific_suffix = lookup(each.value, "honorific_suffix", null)
    middle_name      = lookup(each.value, "middle_name", null)
  }

  dynamic "emails" {
    for_each = each.value.emails
    content {
      value   = lookup(emails.value, "value", null)
      primary = lookup(emails.value, "primary", null)
      type    = lookup(emails.value, "type", null)
    }
  }

  dynamic "addresses" {
    for_each = each.value.addresses
    content {
      country        = lookup(addresses.value, "country", null)
      formatted      = lookup(addresses.value, "formatted", null)
      locality       = lookup(addresses.value, "locality", null)
      postal_code    = lookup(addresses.value, "postal_code", null)
      primary        = lookup(addresses.value, "primary", null)
      region         = lookup(addresses.value, "region", null)
      street_address = lookup(addresses.value, "street_address", null)
      type           = lookup(addresses.value, "type", null)
    }
  }

  dynamic "phone_numbers" {
    for_each = each.value.phone_numbers
    content {
      value   = lookup(phone_numbers.value, "value", null)
      primary = lookup(phone_numbers.value, "primary", null)
      type    = lookup(phone_numbers.value, "type", null)
    }
  }
}