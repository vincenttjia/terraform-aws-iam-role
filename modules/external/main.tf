resource "null_resource" "is_path_valid" {
  count                                                    = "${substr(var.role_path, 0, 1) == "/" && substr(var.role_path, -1, 1) == "/" ? 0 : 1}"
  "Path names must begin and end with a forward slash (/)" = true
}

data "aws_iam_policy_document" "without_external_id" {
  statement = {
    sid     = "AllowAssumeRoleForAnotherAccount"
    actions = ["sts:AssumeRole"]

    principals = {
      type        = "AWS"
      identifiers = ["${var.account_id}"]
    }
  }
}

data "aws_iam_policy_document" "with_external_id" {
  statement = {
    sid     = "AllowAssumeRoleForAnotherAccount"
    actions = ["sts:AssumeRole"]

    principals = {
      type        = "AWS"
      identifiers = ["${var.account_id}"]
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

module "this" {
  source = "../../"

  role_name        = "${var.role_name}"
  role_path        = "${substr(var.role_path, 0, 10) == "/external/" ? var.role_path : format("/external%s", var.role_path)}"
  role_description = "${var.role_description}"

  role_assume_policy         = "${var.external_id == "" ? data.aws_iam_policy_document.without_external_id.json : data.aws_iam_policy_document.with_external_id.json}"
  role_force_detach_policies = true
}
