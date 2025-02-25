resource "azurerm_mysql_flexible_server" "mysql_server" {
  name                   = var.configuration.mysql_server_name
  location               = var.location
  resource_group_name    = var.resource_group_name
  administrator_login    = var.configuration.mysql_admin_login
  administrator_password = var.administrator_login_password
  sku_name               = var.configuration.mysql_server_sku
  version                = var.configuration.mysql_server_version
  zone                   = var.configuration.mysql_server_zone

  tags = var.tags
}

resource "azurerm_mysql_flexible_database" "mysql_db" {
  for_each            = { for idx, db in var.configuration.mysql_database : idx => db }
  name                = each.value.mysql_database_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.mysql_server.name
  charset             = each.value.mysql_database_charset
  collation           = each.value.mysql_database_collation
  lifecycle {
    prevent_destroy = true
  }
}

#Llamamos al modulo de dns para crear una zona para el pe del server mysql
# module "mysql_dns_zone" {
#   source    = "git::https://github.com/MahouECommerce/iac-az-tfmodules.git//iac-az-tfmodule-dns"
#   resource_group_name = var.resource_group_name
#   dnszonename = var.dns_name
#   vnet_id = var.aks_vnet_id
#   dnsvnetlinkname = "${var.dns_name}-link"
#   tags = var.tags
# }
