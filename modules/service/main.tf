data "aws_iam_policy_document" "services" {
  statement = {
    actions = ["sts:AssumeRole"]

    principals = {
      type        = "Service"
      identifiers = "${var.aws_services}"
    }
  }
}

module "role" {
  source = "../../"

  role_name        = "${var.role_name}"
  role_path        = "${var.role_path}"
  role_description = "${var.role_description}"
  policy_document  = "${data.aws_iam_policy_document.services.json}"
}
