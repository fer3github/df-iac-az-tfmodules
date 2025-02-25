resource "azurerm_federated_identity_credential" "federated_credential" {
  name                = "fc-${var.serviceaccount_name}"
  resource_group_name = var.resource_group_name
  audience            = ["api://AzureADTokenExchange"]
  issuer              = var.aks_oidc_issuer_url #la uri del cluster
  parent_id           = var.managed_identity_id # el id de la managed identity de aks (agentpool)
  subject             = "system:serviceaccount:${var.namespace}:${var.serviceaccount_name}"
}
