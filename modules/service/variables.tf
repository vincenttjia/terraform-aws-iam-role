variable "role_purpose" {
  description = "The purpose of the role. It will be appended to predefined prefix and set as role name."
  type        = "string"
}

variable "role_description" {
  description = "The description of the role."
  type        = "string"
}

variable "aws_service" {
  description = "AWS service that are allowed to perform actions granted on your behalf. Example: 'lambda.amazonaws.com'"
  type        = "string"
}
