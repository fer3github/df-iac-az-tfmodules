
output "mssql_id" {
  value = azurerm_mssql_server.sql_server.id
}

# output "sql_dns_id" {
#   value = module.sql_dns_zone.sql_dns_id
# }