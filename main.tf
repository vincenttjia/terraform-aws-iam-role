# Added provider AWS version constraint. `max_session_duration` is supported on 1.14.0
provider "aws" {
  version = "~> 1.14"
  region  = "ap-southeast-1"
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
  max_session_duration  = "${var.role_max_session_duration}"
}
