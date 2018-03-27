provider "aws" {
  version = ">= 1.12.0"
  region  = "ap-southeast-1"
}

module "this" {
  source = "../../modules/user"

  role_name        = "test_role_user_without_mfa"
  role_path        = "/test/"
  role_description = "Example Role for IAM User"

  trusted_users = [
    "arn:aws:iam::123456789012:user/rafikurnia",
    "arn:aws:iam::123456789012:user/rafikurniaputra",
  ]

  mfa_required = false
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = "${module.this.role_name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}
