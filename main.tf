# This module was updated using terraform 0.11.4 at 2018/03/23.
terraform {
  required_version = ">= 0.11.4"
}

# Get the access to the effective Account ID, User ID, and ARN in which Terraform is authorized.
data "aws_caller_identity" "current" {}

# Provides an IAM role.
resource "aws_iam_role" "this" {
  name        = "${var.role_name}"
  path        = "${var.role_path}"
  description = "${var.role_description}"

  assume_role_policy    = "${var.role_assume_policy}"
  force_detach_policies = "${var.role_force_detach_policies}"
}
