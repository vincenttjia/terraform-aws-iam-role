data "aws_iam_policy_document" "with_mfa" {
  statement = {
    actions = ["sts:AssumeRole"]

    principals = {
      type        = "AWS"
      identifiers = "${var.trusted_users}"
    }

    condition = [
      {
        test     = "Bool"
        variable = "aws:MultiFactorAuthPresent"
        values   = ["true"]
      },
    ]
  }
}

data "aws_iam_policy_document" "without_mfa" {
  statement = {
    actions = ["sts:AssumeRole"]

    principals = {
      type        = "AWS"
      identifiers = "${var.trusted_users}"
    }
  }
}

module "this" {
  source = "../../"

  role_name        = "${var.role_name}"
  role_path        = "${var.role_path}"
  role_description = "${var.role_description}"

  role_assume_policy         = "${var.mfa_required ? data.aws_iam_policy_document.with_mfa.json : data.aws_iam_policy_document.without_mfa.json}"
  role_force_detach_policies = true
}
