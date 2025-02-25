resource "azurerm_user_assigned_identity" "identity" {
  location            = var.location
  name                = var.identityname
  resource_group_name = var.resource_group_name

  tags = var.tags
}

resource "azurerm_role_assignment" "example" {
  scope                = var.private_dns_zone_id
  role_definition_name = "Private DNS Zone Contributor"
  principal_id         = azurerm_user_assigned_identity.identity.principal_id
}

resource "azurerm_role_assignment" "example2" {
  scope                = var.vnet_id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.identity.principal_id
}