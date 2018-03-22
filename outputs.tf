output "role_name" {
  description = "The name of the role."
  value       = "${aws_iam_role.role.name}"
}

output "role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = "${aws_iam_role.role.arn}"
}
