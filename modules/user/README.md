terraform-aws-iam-role/user
===========================

This module allows you to create an IAM Role for User.

Usage
-----

You can open this example: [IAM Role for User](https://github.com/traveloka/terraform-aws-iam-role/tree/master/examples/user_iam)

Important Notes
---------------
* `mfa_required` is optional variable, default to `true`, and recommended value is also `true`. Only set the value to `false` if the user can not use MFA.

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