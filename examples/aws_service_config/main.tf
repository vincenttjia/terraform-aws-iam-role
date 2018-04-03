provider "aws" {
  version = "~> 1.13.0"
  region  = "ap-southeast-1"
}

module "this" {
  source = "../../modules/service"

  role_identifier            = "Default Config"
  role_description           = "Service Role for Default AWS Config"
  role_force_detach_policies = false
  aws_service                = "config.amazonaws.com"
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = "${module.this.role_name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRole"
}
