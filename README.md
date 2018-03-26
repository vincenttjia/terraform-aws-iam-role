terraform-aws-iam-role
======================

Terraform module to create AWS IAM Role. 
Currently supported type of Roles are:
1. Role for AWS Service
2. Role for IAM User
3. Role for External AWS Account

Usage
-----

This module will only create an IAM Role and its Trust Relationships policy document. You need to attach your own poliy document outside the module.

To use a particular type of supported role, you can go into `modules` folder and see `README.md` at each subfolder.

To understand better on how to use this module, you can go into `examples` folder and try to execute them.

Modules
--------

* [AWS Service](https://github.com/traveloka/terraform-aws-iam-role/tree/master/modules/service)
* [IAM User](https://github.com/traveloka/terraform-aws-iam-role/tree/master/modules/user)
* [External AWS Account](https://github.com/traveloka/terraform-aws-iam-role/tree/master/modules/external)

Examples
--------

* [Service Role for Lambda](https://github.com/traveloka/terraform-aws-iam-role/tree/master/examples/aws_service_lambda)
* [IAM Role for 3rd Party AWS Account](https://github.com/traveloka/terraform-aws-iam-role/tree/master/examples/external_account)
* [IAM Role for User](https://github.com/traveloka/terraform-aws-iam-role/tree/master/examples/user_iam)


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