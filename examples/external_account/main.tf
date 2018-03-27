provider "aws" {
  version = ">= 1.12.0"
  region  = "ap-southeast-1"
}

module "this" {
  source = "../../modules/external"

  role_name        = "test_role_another_account_with_external_id"
  role_path        = "/external/"
  role_description = "Example Role for External Account"

  account_id  = "123456789012"
  external_id = "ABCDEFGHIJ01"
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = "${module.this.role_name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}
