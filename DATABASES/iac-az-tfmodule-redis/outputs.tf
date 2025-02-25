# outputs.tf
output "redis_cache_id" {
  value = azurerm_redis_cache.redis.id
}

output "redis_cache_host" {
  value = azurerm_redis_cache.redis.primary_access_key
}

output "redis_cache_port" {
  value = azurerm_redis_cache.redis.primary_access_key
}
