resource "azurerm_virtual_network_peering" "peeringelz" {
  name                      = var.peeringname
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.vnetname
  remote_virtual_network_id = var.targetvnetid
  allow_forwarded_traffic   = var.allow_forwarded_traffic
  allow_gateway_transit     = var.allow_gateway_transit

}