resource "azurerm_private_endpoint" "example" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = var.connection_name
    private_connection_resource_id = var.connected_resource_id
    subresource_names              = var.pe_config.connection_subresources
    is_manual_connection           = var.pe_config.is_manual_connection
  }

  private_dns_zone_group {
    name                 = var.pe_config.dns_zone_name
    private_dns_zone_ids = [var.pe_config.dns_zone_id]
  }
  tags = var.tags
}
