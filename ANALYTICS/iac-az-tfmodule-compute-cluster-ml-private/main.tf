resource "azurerm_machine_learning_compute_cluster" "image-builder" {
  name                          = var.ml_compute_cluster_name
  location                      = var.location
  vm_priority                   = var.ml_compute_cluster_vm_priority
  vm_size                       = var.ml_compute_cluster_vm_size
  machine_learning_workspace_id = var.ml_workspace_id
  subnet_resource_id            = var.subnet_id

  scale_settings {
    min_node_count                       = 0
    max_node_count                       = 3
    scale_down_nodes_after_idle_duration = "PT15M" # 120 seconds
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_machine_learning_compute_cluster" "compute" {
  name                          = var.image_build_compute_name
  location                      = var.location
  vm_priority                   = var.ml_compute_cluster_vm_priority
  vm_size                       = var.ml_batch_cluster_vm_size
  machine_learning_workspace_id = var.ml_workspace_id
  subnet_resource_id            = var.subnet_id

  scale_settings {
    min_node_count                       = 0
    max_node_count                       = 3
    scale_down_nodes_after_idle_duration = "PT15M" # 120 seconds
  }

  identity {
    type = "SystemAssigned"
  }
}

# resource "azurerm_role_assignment" "mlbatch_to_st" {
#   scope                = var.storage_account_id
#   role_definition_name = "Storage Blob Data Owner"
#   principal_id         = azurerm_machine_learning_compute_cluster.adl_aml_ws_compute_cluster_batch[0].identity[0].principal_id
# }

# # Datastore

# resource "azurerm_resource_group_template_deployment" "arm_aml_create_datastore" {
#   name                = "arm_aml_create_datastore"
#   resource_group_name = var.resource_group_name
#   deployment_mode     = "Incremental"
#   parameters_content = jsonencode({
#     "WorkspaceName" = {
#       value = azurerm_machine_learning_workspace.ml_workspace.name
#     },
#     "StorageAccountName" = {
#       value = var.storage_account_name
#     }
#   })

#   depends_on = [time_sleep.wait_30_seconds]

#   template_content = <<TEMPLATE
#  {
#    "$schema": "http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
#    "contentVersion": "1.0.0.0",
#    "parameters": {
#          "WorkspaceName": {
#              "type": "String"
#          },
#          "StorageAccountName": {
#              "type": "String"
#          }
#      },
#    "resources": [
#          {
#              "type": "Microsoft.MachineLearningServices/workspaces/datastores",
#              "apiVersion": "2021-03-01-preview",
#              "name": "[concat(parameters('WorkspaceName'), '/workspaceblobstore')]",
#              "dependsOn": [],
#              "properties": {
#                  "contents": {
#                      "accountName": "[parameters('StorageAccountName')]",
#                      "containerName": "default",
#                      "contentsType": "AzureBlob",
#                      "credentials": {
#                        "credentialsType": "None"
#                      },
#                      "endpoint": "core.windows.net",
#                      "protocol": "https"
#                    },
#                    "description": "Default datastore for mlops-tabular",
#                    "isDefault": false,
#                    "properties": {
#                      "ServiceDataAccessAuthIdentity": "None"
#                    },
#                    "tags": {}
#                  }
#          }
#    ]
#  }
#  TEMPLATE
# }

# resource "time_sleep" "wait_30_seconds" {

#   depends_on = [
#     azurerm_machine_learning_workspace.ml_workspace
#   ]

#   create_duration = "30s"
# }

