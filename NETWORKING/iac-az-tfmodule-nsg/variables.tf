#Required Variables
variable "resource_group_name" {
  type        = string
  description = "The Resource Group name"

  #validation {
  #condition     = can(regex("^rg-[a-zA-Z]+-(?:pro|pre|play)-(?:z|a)-(?:weu|scp)$", var.resource_group_name))
  # error_message = "The Resource Group needs to follow the naming convention, e.g.:'rg-myapp-pro-z-weu'."
  #}
}

variable "location" {
  description = "Ubicación del NSG"
}

variable "tags" {
  type = map(string)
}

variable "nsgname" {
  type = string
}

variable "security_rules" {

}




