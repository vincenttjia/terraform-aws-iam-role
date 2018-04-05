variable "service_name" {
  description = "The name of the service that going to assume this role."
  type        = "string"
}

variable "cluster_role" {
  description = "The role of the cluster that going to assume this role."
  type        = "string"
}

variable "role_force_detach_policies" {
  description = "Specifies to force detaching any policies the role has before destroying it."
  default     = false
}
