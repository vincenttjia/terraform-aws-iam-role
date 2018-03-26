provider "aws" {
  version = ">= 1.12.0"
  region  = "ap-southeast-1"
}

module "this" {
  source = "../../modules/service"

  role_purpose     = "Example Lambda"
  role_description = "Enable example lambda function to create log group."
  aws_service      = "lambda.amazonaws.com"
}

data "aws_iam_policy_document" "this" {
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

resource "aws_iam_role_policy" "this" {
  name = "AllowLambdaToCreateLogGroup"
  role = "${module.this.role_name}"

  policy = "${data.aws_iam_policy_document.this.json}"
}
