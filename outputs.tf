output "groups" {
  description = "All attributes of the newly created AWS SSO groups in the identity store."
  value       = aws_identitystore_group.this
}

output "users" {
  description = "All attributes of the newly created AWS SSO users in the identity store."
  value       = aws_identitystore_user.this
}