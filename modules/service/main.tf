# Trust relationship policy document for AWS Service.
data "aws_iam_policy_document" "this" {
  statement = {
    actions = ["sts:AssumeRole"]

    principals = {
      type        = "Service"
      identifiers = ["${var.aws_service}"]
    }
  }
}

# Module, the parent module.
module "this" {
  source = "../../"

  role_name        = "ServiceRoleFor${title(element(split(".", var.aws_service), 0))}_${join("-", split(" ", lower(var.role_purpose)))}"
  role_path        = "/service-role/${var.aws_service}/"
  role_description = "${var.role_description}"

  role_assume_policy         = "${data.aws_iam_policy_document.this.json}"
  role_force_detach_policies = true
}
