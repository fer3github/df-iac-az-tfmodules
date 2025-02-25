# main.tf

resource "azurerm_redis_cache" "redis" {
  name                          = var.redis_cache_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  sku_name                      = var.redis_sku_name
  capacity                      = var.redis_capacity
  non_ssl_port_enabled          = var.enable_non_ssl_port
  family                        = var.redis_family
  minimum_tls_version           = var.minimum_tls_version
  public_network_access_enabled = var.public_network_access_enabled
  tags                          = var.tags
  redis_configuration {
    data_persistence_authentication_method = var.data_persistence_authentication_method
  }
}
