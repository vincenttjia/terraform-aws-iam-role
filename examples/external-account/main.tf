provider "aws" {
  region = "ap-southeast-1"
}

module "this" {
  # In actual use case, you have to replace the following line (line 8) with:
  # source = "github.com/traveloka/terraform-aws-iam-role.git//modules/external?ref=v0.3.0"
  source = "../../modules/external"

  role_name                  = "ThirdPartyName"      # Replace this value with the name given by 3rd party, or define it by yourself with clear and describing name
  role_path                  = "/external/security/"
  role_description           = "Role for ThirdParty"
  role_force_detach_policies = true
  role_max_session_duration  = 43200

  account_id  = "123456789012" # Replace this with 3rd party's AWS Account ID
  external_id = "ABCDEFGHIJ01" # Don't set the value if not needed, only set this value if the 3rd party ask you to specify external_id.
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = "${module.this.role_name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}
