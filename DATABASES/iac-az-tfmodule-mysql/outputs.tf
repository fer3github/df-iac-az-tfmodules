
output "mysql_id" {
  value = azurerm_mysql_flexible_server.mysql_server.id
}

# output "mysql_dns_id" {
#   value = module.mysql_dns_zone.mysql_dns.id
# }