resource "azurerm_cdn_endpoint" "cdn_endpoint" {
  location            = var.location
  resource_group_name = var.resource_group_name
  name                = var.name
  profile_name        = var.profile_name
  origin_host_header  = var.origin_host_header
  tags                = var.tags
  querystring_caching_behaviour = "NotSet"
  origin {
    name      = var.origin
    host_name = var.host_name
  }
  lifecycle {
    ignore_changes = [
      is_compression_enabled,
      content_types_to_compress,
      geo_filter,
      delivery_rule,
      global_delivery_rule
    ]
  }
}
