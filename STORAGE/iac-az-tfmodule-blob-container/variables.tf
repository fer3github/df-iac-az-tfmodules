variable "name" {
  type        = string
  description = "(Required) Name for the blob"
}

variable "st_name" {
  type        = string
  description = "(Required) ID of the Storage Account"
}

variable "container_access_type" {
  type        = string
  description = "(Required) Container access type"
}