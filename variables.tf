variable "sso_groups" {
  description = "A map of AWS SSO groups"
  type = map(object({
    description = optional(string)
  }))
}

variable "sso_users" {
  description = "A map of AWS SSO users"
  type = map(object({
    display_name       = string
    given_name         = string
    family_name        = string
    sso_groups         = list(string)
    locale             = optional(string)
    nickname           = optional(string)
    preferred_language = optional(string)
    profile_url        = optional(string)
    timezone           = optional(string)
    title              = optional(string)
    user_type          = optional(string)
    emails = optional(list(object({
      value   = optional(string)
      primary = optional(bool, true)
      type    = optional(string)
    })), []),
    addresses = optional(list(object({
      country        = optional(string)
      formatted      = optional(string)
      locality       = optional(string)
      postal_code    = optional(string)
      primary        = optional(bool, true)
      region         = optional(string)
      street_address = optional(string)
      type           = optional(string)
    })), []),
    phone_numbers = optional(list(object({
      value   = optional(string)
      primary = optional(bool, true)
      type    = optional(string)
    })), [])
  }))
}
