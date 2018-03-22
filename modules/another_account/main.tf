data "aws_iam_policy_document" "without_external_id" {
  statement = {
    sid     = "AllowAssumeRoleForAnotherAccount"
    actions = ["sts:AssumeRole"]

    principals = {
      type        = "AWS"
      identifiers = ["${var.trusted_account_id}"]
    }
  }
}

data "aws_iam_policy_document" "with_external_id" {
  statement = {
    sid     = "AllowAssumeRoleForAnotherAccount"
    actions = ["sts:AssumeRole"]

    principals = {
      type        = "AWS"
      identifiers = ["${var.trusted_account_id}"]
    }

    condition = [
      {
        test     = "StringEquals"
        variable = "sts:ExternalId"

        values = ["${var.external_id}"]
      },
    ]
  }
}

module "role" {
  source = "../../"

  role_name        = "${var.role_name}"
  role_path        = "${var.role_path}"
  role_description = "${var.role_description}"
  policy_document  = "${var.external_id == "" ? data.aws_iam_policy_document.without_external_id.json : data.aws_iam_policy_document.with_external_id.json}"
}
