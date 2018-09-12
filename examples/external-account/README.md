example/external_account
========================

This example will create an IAM Role for external AWS Account with `AmazonEC2ReadOnlyAccess` managed policy attached.

This won't be succesfully applied unless you change the value of `principal_identifiers`.
Currently the principal identifiers with that Account ID is not exist, that is why the value must be changed first.