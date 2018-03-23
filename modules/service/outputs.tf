output "role_name" {
  description = "The name of the role."
  value       = "${module.role.role_name}"
}

output "role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = "${module.role.role_arn}"
}
