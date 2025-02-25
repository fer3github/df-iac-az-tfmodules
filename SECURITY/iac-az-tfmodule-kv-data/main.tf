resource "azurerm_key_vault" "key_vault" {
  name                            = var.kvname
  location                        = var.location
  resource_group_name             = var.resource_group_name
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_template_deployment = var.enabled_for_template_deployment
  tenant_id                       = data.azurerm_subscription.current.tenant_id
  # soft_delete_enabled             = true
  enable_rbac_authorization     = var.kv_rbac_auth
  purge_protection_enabled      = var.kv_purge_protection
  sku_name                      = var.sku_name
  public_network_access_enabled = var.public_network_access_enabled

  network_acls {
    bypass                     = var.network_acls.bypass
    default_action             = var.network_acls.default_action
    virtual_network_subnet_ids = var.network_acls.virtual_network_subnet_ids
  }

  tags = var.tags
}

#resource "azurerm_private_endpoint" "privateendpoint-keyvault" {
# name                = "${var.kvname}-pe"
# location            = var.location
#resource_group_name = var.resource_group_name
#subnet_id           = var.pe_subnet_id


#private_service_connection {
# name                           = "${var.kvname}-connection"
# is_manual_connection           = false
# private_connection_resource_id = azurerm_key_vault.key_vault.id
#subresource_names              = ["Vault"]
#https://learn.microsoft.com/en-us/azure/private-link/private-endpoint-overview#private-link-resource
#}


# private_dns_zone_group {
#   name                 = var.private_vault_dns_zone_name
#   private_dns_zone_ids = var.private_vault_dns_zone_ids
# }
#}


#resource "azurerm_role_assignment" "mid-kv" {
# scope                = azurerm_key_vault.key_vault.id
#role_definition_name = "Contributor"
#principal_id         = data.azurerm_user_assigned_identity.mid1.principal_id
#}

#resource "azurerm_role_assignment" "mid-administrator-kv" {
# scope                = azurerm_key_vault.key_vault.id
# role_definition_name = "Key Vault Administrator"
# principal_id         = data.azurerm_user_assigned_identity.mid1.principal_id
#}

#resource "azurerm_role_assignment" "mid-secrets-kv" {
# scope                = azurerm_key_vault.key_vault.id
# role_definition_name = "Key Vault Secrets Officer"
# principal_id         = data.azurerm_user_assigned_identity.mid1.principal_id
#}



