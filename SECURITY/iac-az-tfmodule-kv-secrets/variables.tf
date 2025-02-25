variable "secret_list" {
  type = list(object({
    secretname  = string
    secretvalue = string
  }))
  description = "The secrets list"
}

variable "keyvault_id" {
  type        = string
  description = "The keyvault id"
}

variable "tags" {
  type = map(string)
  # default = {
  #   file-encoding= "utf-8"
  # }
}