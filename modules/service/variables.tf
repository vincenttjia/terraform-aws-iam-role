variable "role_identifier" {
  description = "The name to identify the role. It will be appended to predefined prefix and set as role name."
  type        = "string"
}

variable "role_description" {
  description = "The description of the role."
  type        = "string"
}

variable "aws_service" {
  description = "AWS service that are allowed to perform actions granted on your behalf. Example value: 'lambda.amazonaws.com'"
  type        = "string"
}
