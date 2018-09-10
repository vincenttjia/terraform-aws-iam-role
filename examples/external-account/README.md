example/external_account
========================

This example will create an IAM Role for external AWS Account with `AmazonEC2ReadOnlyAccess` managed policy attached.

This won't be succesfully applied unless you change the value of `principle_identifiers`.
Currently the principle identifiers with that Account ID is not exist, that is why the value must be changed first.