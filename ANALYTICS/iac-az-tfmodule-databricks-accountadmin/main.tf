
resource "databricks_service_principal_role" "account_admin" {
  service_principal_id = var.service_principal_id
  role                 = "account_admin"
}