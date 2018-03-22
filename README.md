# terraform-aws-iam-role

Terraform module to create AWS IAM Role. 
Currently supported type of Roles are:
1. Role for AWS Service
2. Role for IAM User
3. Role for External Account

## Role for AWS Service

### Variables

#### Required Variables

##### role_name
* Description: The name of the role. It will forces new resource on change.
* Type: String

##### aws_services
* Description: AWS services that are allowed to perform actions granted on your behalf.
* Type: List

#### Optional Variables

##### role_path
* Description: The path to the role. See https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html for more information.
* Type: String
* Default: "/"

##### role_description
* Description: The description of the role.
* Type: String
* Default: ""

### Outputs

##### role_name
* Description: The name of the role.
* Type: String

##### role_arn
* Description: The Amazon Resource Name (ARN) specifying the role.
* Type: String

### Usage:

```hcl
provider "aws" {
  version = ">= 0.11.3"
  region  = "ap-southeast-1"
}

module "example_role" {
  source = "git::ssh://git@git.traveloka.com/source/terraform-aws-iam-role.git//modules/aws_service?ref=0.0.2"

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

output "role_name" {
  description = "The name of the role."
  value       = "${module.example_role.role_name}"
}

output "role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = "${module.example_role.role_arn}"
}
```

## Role for IAM User

### Variables

#### Required Variables

##### role_name
* Description: The name of the role. It will forces new resource on change.
* Type: String

##### trusted_users
* Description: Users that are trusted for assuming the rule.
* Type: List

#### Optional Variables

##### role_path
* Description: The path to the role. See https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html for more information.
* Type: String
* Default: "/"

##### role_description
* Description: The description of the role.
* Type: String
* Default: ""

##### mfa_required
* Description: Require MFA to assume the role.
* Type: Boolean
* Default: True

### Outputs

##### role_name
* Description: The name of the role.
* Type: String

##### role_arn
* Description: The Amazon Resource Name (ARN) specifying the role.
* Type: String

### Usage:

```hcl
provider "aws" {
  version = ">= 0.11.3"
  region  = "ap-southeast-1"
}

module "example_role" {
  source = "git::ssh://git@git.traveloka.com/source/terraform-aws-iam-role.git//modules/aws_service?ref=0.0.2"

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

output "role_name" {
  description = "The name of the role."
  value       = "${module.example_role.role_name}"
}

output "role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = "${module.example_role.role_arn}"
}
```

## Role for External Account

### Variables

#### Required Variables

##### role_name
* Description: The name of the role. It will forces new resource on change.
* Type: String

##### trusted_account_id
* Description: AWS Account ID that allowed to assume this role.
* Type: String

#### Optional Variables

##### role_path
* Description: The path to the role. See https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html for more information.
* Type: String
* Default: "/"

##### role_description
* Description: The description of the role.
* Type: String
* Default: ""

##### external_id
* Description: External ID provided by third party.
* Type: String
* Default: ""

### Outputs

##### role_name
* Description: The name of the role.
* Type: String

##### role_arn
* Description: The Amazon Resource Name (ARN) specifying the role.
* Type: String

### Usage:

```hcl
provider "aws" {
  version = ">= 0.11.3"
  region  = "ap-southeast-1"
}

module "example_role" {
  source = "git::ssh://git@git.traveloka.com/source/terraform-aws-iam-role.git//modules/aws_service?ref=0.0.2"

  role_name = "test_role_another_account_with_external_id"
  role_path = "/external/"

  trusted_account_id = "717210094962"
  external_id        = "XTL7R32SA8AR"
}

resource "aws_iam_role_policy_attachment" "ec2_read_only_managed_policy" {
  role       = "${module.example_role.role_name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}

output "role_name" {
  description = "The name of the role."
  value       = "${module.example_role.role_name}"
}

output "role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = "${module.example_role.role_arn}"
}
```

## Authors
- [Rafi Kurnia Putra](https://github.com/rafikurnia)

## License
Apache 2 Licensed. See LICENSE for full details.
