example/user_iam
================

This example will create an IAM Role for users with `AmazonS3ReadOnlyAccess` managed policy attached.

This won't be succesfully applied unless you change the value of `trusted_users`.
Currently the AWS Account with these Account IDs are not exist, that is why the values must be changed first.