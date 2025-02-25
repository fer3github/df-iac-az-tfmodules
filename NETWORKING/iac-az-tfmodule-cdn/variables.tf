
variable "cdn_config" {
  type = object({
    name        = string
    sku         = string
    origin_name = string
    origin_url  = string
    st_name     = string
    location    = string
  })
}

variable "sc_config" {
  type = object({
    name   = string
    access = string
  })
}
variable "endpoint_config" {
  type = object({
    name     = string
    sastoken = string
    querystring_caching_behaviour = string
  })
}

variable "gdr_config" {
  type = object({
    destination             = string
    preserve_unmatched_path = bool
    source_pattern          = string
  })
}

variable sc_id{
  type=string
  default = null
}

variable "location" {}

variable "resource_group_name" {}

variable "tags" {}

