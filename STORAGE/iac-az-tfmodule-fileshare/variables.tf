variable "name" {
  type        = string
  description = "(Required) Name for the file share"
}
variable "st_name" {
  type        = string
  description = "(Required) Storage Account name"
}

variable "quota" {
  type        = number
  description = "(Required) Quota of the file share"
}

variable "tags" {
  type = map(string)
}