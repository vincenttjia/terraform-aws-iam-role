variable "role_identifier" {
  description = "Brief description to identify the role. It will be appended as suffix to the role name. Example value: 'Default Config'"
  type        = "string"
}

variable "role_description" {
  description = "The description of the role."
  type        = "string"
}

variable "role_force_detach_policies" {
  description = "Specifies to force detaching any policies the role has before destroying it."
  default     = false
}

variable "aws_service" {
  description = "AWS service that are allowed to perform actions granted on your behalf. Example value: 'config.amazonaws.com'"
  type        = "string"
}
