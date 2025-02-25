resource "azurerm_mssql_server" "sql_server" {
  name                          = var.configuration.sql_server_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  version                       = var.configuration.sql_server_version
  administrator_login           = var.configuration.sql_admin_login
  administrator_login_password  = var.administrator_login_password
  tags                          = var.tags
  public_network_access_enabled = var.configuration.sql_public_network
}

resource "azurerm_mssql_database" "sql_db" {
  for_each       = { for idx, db in var.configuration.sql_database : idx => db }
  name           = each.value.sql_database_name
  server_id      = azurerm_mssql_server.sql_server.id
  collation      = each.value.sql_database_collation
  license_type   = each.value.sql_database_license
  max_size_gb    = each.value.sql_database_max_size
  sku_name       = each.value.sql_database_sku
  zone_redundant = each.value.sql_database_redundancy
  enclave_type   = each.value.sql_database_enclave
  tags           = var.tags
  lifecycle {
    prevent_destroy = true
  }
}

#Llamamos al modulo de dns para crear una zona para el pe del server sql
# module "sql_dns_zone" {
#   source    = "git::https://github.com/MahouECommerce/iac-az-tfmodules.git//iac-az-tfmodule-dns"
#   resource_group_name = var.resource_group_name
#   dnszonename = var.dns_name
#   vnet_id = var.aks_vnet_id
#   dnsvnetlinkname = "${var.dns_name}-link"
#   tags = var.tags
# }