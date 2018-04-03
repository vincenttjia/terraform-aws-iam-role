# This example was created using terraform-provider-aws version 1.13.0 at 2018/04/03.
provider "aws" {
  version = "~> 1.13.0"
  region  = "ap-southeast-1"
}

module "this" {
  source = "../../modules/user" # In actual use case, you have to replace this line with: source = "github.com/traveloka/terraform-aws-iam-role.git//modules/user?ref=0.0.1"

  role_name                  = "SuperAdmin"
  role_path                  = "/mgmt/"                                       # mgmt stands for management. They will have access to manage the entire resources within the account
  role_description           = "Role for Users with Administrator Privillege"
  role_force_detach_policies = true

  trusted_users = [
    "arn:aws:iam::123456789012:user/rafi.putra", # In actual use case, you have to replace this line with correct IAM User ARN
  ]

  mfa_required = true # Set this value to false only when needed
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = "${module.this.role_name}"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
