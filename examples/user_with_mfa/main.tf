provider "aws" {
  region = "ap-southeast-1"
}

module "example_role" {
  source = "../../modules/user"

  role_name = "test_role_user_with_mfa"
  role_path = "/test/"

  trusted_users = [
    "arn:aws:iam::123456789012:user/rafikurnia",
    "arn:aws:iam::123456789012:user/rafikurniaputra",
  ]

  mfa_required = true
}

resource "aws_iam_role_policy_attachment" "s3_read_only_managed_policy" {
  role       = "${module.example_role.role_name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}
