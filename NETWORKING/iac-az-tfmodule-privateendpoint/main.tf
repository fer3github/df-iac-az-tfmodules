resource "azurerm_private_endpoint" "example" {
  name                = var.pe_config.name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = var.pe_config.connection_name
    private_connection_resource_id = var.connected_resource_id
    subresource_names              = var.pe_config.connection_subresources
    is_manual_connection           = var.pe_config.is_manual_connection
  }

  private_dns_zone_group {
    name                 = var.dns_name
    private_dns_zone_ids = [var.dns_zone]
  }
  tags = var.tags
}