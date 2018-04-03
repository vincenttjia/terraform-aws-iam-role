# This example was created using terraform-provider-aws version 1.13.0 at 2018/04/03.
provider "aws" {
  version = "~> 1.13.0"
  region  = "ap-southeast-1"
}

module "this" {
  source = "../../modules/external" # In actual use case, you have to replace this line with: source = "github.com/traveloka/terraform-aws-iam-role.git//modules/external?ref=0.0.1"

  role_name                  = "ThirdPartyName"      # Replace this value with the name given by 3rd party, or define it by yourself with clear and describing name
  role_path                  = "/external/security/"
  role_description           = "Role for ThirdParty"
  role_force_detach_policies = true

  account_id  = "123456789012" # Replace this with 3rd party's AWS Account ID
  external_id = "ABCDEFGHIJ01" # Only set this value if the 3rd party ask you to
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = "${module.this.role_name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}
