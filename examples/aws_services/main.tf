provider "aws" {
  version = ">= 0.11.3"
  region  = "ap-southeast-1"
}

module "example_role" {
  source = "../../modules/aws_services"

  role_name        = "ServiceRoleForLambda_example-lambda-function"
  role_path        = "/service-role/lambda.amazonaws.com/"
  role_description = "Enable example-lambda-function to create log group."
  aws_services     = ["lambda.amazonaws.com"]
}

data "aws_iam_policy_document" "example_inline_policy_document" {
  statement = [
    {
      effect = "Allow"

      actions = [
        "logs:CreateLogGroup",
      ]

      resources = [
        "arn:aws:logs:*",
      ]
    },
  ]
}

resource "aws_iam_role_policy" "example_inline_policy" {
  name = "AllowLambdaToCreateLogGroup"
  role = "${module.example_role.role_name}"

  policy = "${data.aws_iam_policy_document.example_inline_policy_document.json}"
}
