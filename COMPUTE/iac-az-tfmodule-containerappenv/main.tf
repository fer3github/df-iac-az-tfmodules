resource "azurerm_container_app_environment" "containerappenv" {
  name                               = var.containerappenvname
  location                           = var.location
  resource_group_name                = var.resource_group_name
  infrastructure_subnet_id           = var.infrastructure_subnet_id
  infrastructure_resource_group_name = var.infrastructure_resource_group_name
  internal_load_balancer_enabled     = true
  zone_redundancy_enabled            = false

  dynamic "workload_profile" {
    for_each = var.workload_profile != null ? var.workload_profile : []
    content {
      name                  = try(workload_profile.value.name, null)
      workload_profile_type = try(workload_profile.value.workload_profile_type, null)
      maximum_count         = try(workload_profile.value.maximum_count, null)
      minimum_count         = try(workload_profile.value.minimum_count, null)
    }
  }

  tags = var.tags

}