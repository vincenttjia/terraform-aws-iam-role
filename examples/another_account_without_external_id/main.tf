provider "aws" {
  region = "ap-southeast-1"
}

module "example_role" {
  source = "../../modules/another_account"

  role_name = "test_role_another_account_without_external_id"
  role_path = "/external/"

  trusted_account_id = "123456789012"
}

resource "aws_iam_role_policy_attachment" "ec2_read_only_managed_policy" {
  role       = "${module.example_role.role_name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}
