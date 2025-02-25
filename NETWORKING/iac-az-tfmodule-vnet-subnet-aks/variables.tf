#Required Variables
variable "resource_group_name" {
  type        = string
  description = "The Resource Group name in which to put the Key Vault"

  #validation {
  #condition     = can(regex("^rg-[a-zA-Z]+-(?:pro|pre|play)-(?:z|a)-(?:weu|scp)$", var.resource_group_name))
  # error_message = "The Resource Group needs to follow the naming convention, e.g.:'rg-myapp-pro-z-weu'."
  #}
}

variable "location" {
  description = "Ubicación de la VNET"
}

variable "vnetname" {
  type        = string
  description = "Name of the Key Vault"

  #validation {
  #condition     = can(regex("^kv-[a-zA-Z]+-(?:pro|pre|play)-(?:z|a)-(?:weu|scp)-\\d{3}$", var.kvname))
  # error_message = "The Key Vault name needs to follow the naming convention, e.g.:'kv-myapp-pro-z-weu-001'."
  #}
}

variable "address_space" {
  type = list(string)
}

variable "tags" {
  type = map(string)
}

variable "nsgname" {
  type = string
}

variable "nsg_id" {
  type = string
}

variable "subnet_list" {}

# variable "nsgrules" {
#   type = list(object({
#     name                       = string
#     priority                   = number
#     direction                  = string
#     access                     = string
#     protocol                   = string
#     source_port_range          = string
#     destination_port_range     = string
#     source_address_prefix      = string
#     destination_address_prefix = string
#   }))
# }


