variable "role_name" {
  description = "The name of the role. It will forces new resource on change."
  type        = "string"
}

variable "role_path" {
  description = "The path to the role. See https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html for more information."
  type        = "string"
  default     = "/"
}

variable "role_description" {
  description = "The description of the role."
  type        = "string"
  default     = ""
}

variable "trusted_account_id" {
  description = "AWS Account ID that allowed to assume this role."
  type        = "string"
}

variable "external_id" {
  description = "External ID provided by third party."
  type        = "string"
  default     = ""
}
