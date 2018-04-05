provider "aws" {
  version = "1.13.0"
  region  = "ap-southeast-1"
}

module "this" {
  source = "../../modules/instance" # In actual use case, you have to replace this line with: source = "github.com/traveloka/terraform-aws-iam-role.git//modules/instance?ref=0.2.0"

  service_name = "txtdata"
  cluster_role = "app"
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = "${module.this.role_name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}
