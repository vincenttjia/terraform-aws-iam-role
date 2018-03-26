terraform-aws-iam-role/user
===========================

This module allows you to create an IAM Role for User.

Usage
-----

```hcl
module "non_mfa_users" {
  source = "github.com/traveloka/terraform-aws-iam-role.git//modules/user?ref=0.0.1"

  role_name        = "test_role_user_without_mfa"
  role_path        = "/test/"
  role_description = "Example Role for IAM User"

  trusted_users = [
    "arn:aws:iam::123456789012:user/rafikurnia",
    "arn:aws:iam::123456789012:user/rafikurniaputra",
  ]

  mfa_required = false
}

resource "aws_iam_role_policy_attachment" "s3_readonly_managed_policy" {
  role       = "${module.non_mfa_users.role_name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}
```

Important Notes
---------------
* `mfa_required` is optional variable, default to `true`. Only set the value to `false` if the user can not use MFA.

Terraform Version
-----------------

This module was created using Terraform 0.11.4. 
So to be more safe, Terraform version 0.11.4 or newer is required to use this module.


Authors
-------

* [Rafi Kurnia Putra](https://github.com/rafikurnia)

License
-------

Apache 2 Licensed. See LICENSE for full details.