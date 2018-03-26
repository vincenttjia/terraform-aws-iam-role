data "aws_iam_policy_document" "this" {
  statement = {
    actions = ["sts:AssumeRole"]

    principals = {
      type        = "Service"
      identifiers = "${var.aws_service}"
    }
  }
}

module "this" {
  source = "../../"

  role_name        = "ServiceRoleFor${title(element(split(".", var.aws_service), 0))_${join("-", split(" ", var.role_purpose))}}"
  role_path        = "/service-role/${var.aws_service}/"
  role_description = "${var.role_description}"
  policy_document  = "${data.aws_iam_policy_document.services.json}"
}
