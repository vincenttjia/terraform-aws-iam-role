terraform-aws-iam-role/external
===============================

This module is meant to create IAM Role for 3rd party or another AWS Account.

Usage
-----

```hcl
module "external" {
  source = "github.com/traveloka/terraform-aws-iam-role.git//modules/external?ref=0.0.1"

  role_name        = "RoleForVendor"
  role_path        = "/external/"
  role_description = "Role for Vendor to assume"

  account_id  = "123456789012"
  external_id = "ABCDEFGHIJ01"
}

resource "aws_iam_role_policy_attachment" "ec2_readonly_managed_policy" {
  role       = "${module.external.role_name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}
```

Important Notes
---------------

* `role_path` should begin and end with a forward slash. Examples:
  * `role_path = "/external/"` -> Valid
  * `role_path = "/external"` -> Invalid
  * `role_path = "external/"` -> Invalid
  * `role_path = "external"` -> Invalid
* For the convention, whether you specify `/external/` to the path or not, it will always be appended. Examples:
  * `role_path = "/external/"` -> IAM Role's Path = /external/
  * `role_path = "/external/vendors/"` -> IAM Role's Path = /external/vendors/
  * `role_path = "/vendors/"` -> IAM Role's Path = /external/vendors/
  * `role_path = "/external/vendors/special/"` -> IAM Role's Path = /external/vendors/special/
  * `role_path = "/vendors/special/"` -> IAM Role's Path = /external/vendors/special/
* `external_id` is optional. Use this only when the 3rd party provides you an ID.


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