resource "aws_iam_role" "role" {
  name        = "${var.role_name}"
  path        = "${var.role_path}"
  description = "${var.role_description}"

  assume_role_policy = "${var.policy_document}"
}
