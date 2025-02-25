resource "azurerm_postgresql_flexible_server" "mysqlpostgre" {
  name                          = var.configuration.postgresql_server_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  version                       = var.configuration.postgresql_server_version
  public_network_access_enabled = var.configuration.public_network_access_enabled
  administrator_login           = var.configuration.postgresql_server_login
  administrator_password        = var.administrator_login_password
  zone                          = var.configuration.zone
  backup_retention_days         = var.configuration.postgresql_backup_retention_days
  geo_redundant_backup_enabled  = var.configuration.geo_redundant_backup_enabled

  storage_mb   = var.configuration.postgresql_storage_mb
  storage_tier = var.configuration.postgresql_storage_tier
  sku_name     = var.configuration.postgresql_sku_name

  tags = var.tags
}
