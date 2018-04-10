terraform-aws-iam-role/external
===============================
This module is meant to create IAM Role for 3rd party or another AWS Account.


Usage
-----
You can open this example: [IAM Role for 3rd Party AWS Account](https://github.com/traveloka/terraform-aws-iam-role/tree/master/examples/external_account)


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
