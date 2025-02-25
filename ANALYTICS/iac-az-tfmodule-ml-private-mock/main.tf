resource "azurerm_machine_learning_workspace" "ml_workspace" {
  name                    = var.ml_name
  location                = var.location
  resource_group_name     = var.resource_group_name
  application_insights_id = var.application_insights_id
  key_vault_id            = var.keyvault_id
  storage_account_id      = var.storage_account_id
  container_registry_id   = var.container_registry_id

  public_network_access_enabled = var.public_network_access_enabled
  image_build_compute_name      = var.image_build_compute_name

  identity {
    type = "SystemAssigned"
  }
  tags = var.tags
}