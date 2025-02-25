
resource "azurerm_cdn_profile" "profile" {
  name                = var.cdn_config.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.cdn_config.sku
  tags                = var.tags
}

resource "azurerm_cdn_endpoint" "endpoint" {
  name                          = var.endpoint_config.name
  profile_name                  = azurerm_cdn_profile.profile.name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  origin_host_header            = var.cdn_config.origin_url
  querystring_caching_behaviour = var.endpoint_config.querystring_caching_behaviour
  tags                          = var.tags
  origin {
    name      = var.cdn_config.origin_name
    host_name = var.cdn_config.origin_url
  }

  global_delivery_rule {
    url_rewrite_action {
      destination             = var.gdr_config.destination
      preserve_unmatched_path = var.gdr_config.preserve_unmatched_path
      source_pattern          = var.gdr_config.source_pattern
    }
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

resource "azurerm_storage_container" "storage_container" {
  name                  = var.sc_config.name
  storage_account_name  = var.cdn_config.st_name
  container_access_type = var.sc_config.access

  depends_on = [azurerm_cdn_endpoint.endpoint]
}
