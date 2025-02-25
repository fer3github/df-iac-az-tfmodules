# Virtual Network
resource "azurerm_virtual_network" "default" {
  name                = var.vnetname
  address_space       = var.vnet_config.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
  depends_on          = [azurerm_network_security_group.nsg-training]
}

# resource "azurerm_subnet" "snet-training" {
#   name                 = "snet-training"
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = azurerm_virtual_network.default.name
#   address_prefixes     = var.vnet_config.address_prefixes_snet_training
#   private_endpoint_network_policies = true
#   depends_on           = [azurerm_network_security_group.nsg-training]
# }

# resource "azurerm_subnet" "snet-workspace" {
#   name                 = "snet-workspace"
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = azurerm_virtual_network.default.name
#   address_prefixes     = var.vnet_config.address_prefixes_snet_workspace
#   private_endpoint_network_policies = true
#   depends_on           = [azurerm_network_security_group.nsg-training]
# }

# Create subnet
resource "azapi_resource" "subnet_training" {
  type      = "Microsoft.Network/virtualNetworks/subnets@2024-01-01"
  name      = "snet-training"
  parent_id = azurerm_virtual_network.default.id

  body = {
    properties = {

      # List of address prefixes in subnet
      addressPrefixes = var.vnet_config.address_prefixes_snet_training

      # Attach to Route Table
      routeTable = {
        id = azurerm_route_table.rt-training.id
      }

      # Attach to NSG
      networkSecurityGroup = {
        id = azurerm_network_security_group.nsg-training.id
      }
    }
  }
}

resource "azapi_resource" "subnet_workspace" {
  type      = "Microsoft.Network/virtualNetworks/subnets@2024-01-01"
  name      = "snet-workspace"
  parent_id = "/subscriptions/8c6b9f56-70ba-46db-8485-762689ffebbc/resourceGroups/rg-ml-demandatest/providers/Microsoft.Network/virtualNetworks/vnet-ml-demandatest"

  body = {
    properties = {
      # List of address prefixes in subnet
      addressPrefixes = var.vnet_config.address_prefixes_snet_workspace

      # Attach to Route Table
      routeTable = {
        id = azurerm_route_table.rt-training.id
      }

      # Attach to NSG
      networkSecurityGroup = {
        id = azurerm_network_security_group.nsg-training.id
      }
    }
  }
}


# Network Security Groups
resource "azurerm_network_security_group" "nsg-training" {
  name                = var.nsgname
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "BatchNodeManagement"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "29876-29877"
    source_address_prefix      = "BatchNodeManagement"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AzureMachineLearning"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "44224"
    source_address_prefix      = "AzureMachineLearning"
    destination_address_prefix = "*"
  }
}

# resource "azurerm_subnet_network_security_group_association" "nsg-training-link" {
#   subnet_id                 = azurerm_subnet.snet-training.id
#   network_security_group_id = azurerm_network_security_group.nsg-training.id
# }

# User Defined Routes

# UDR for compute instance and compute clusters
resource "azurerm_route_table" "rt-training" {
  name                = "rt-training"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_route" "training-Internet-Route" {
  name                = "Internet"
  resource_group_name = var.resource_group_name
  route_table_name    = azurerm_route_table.rt-training.name
  address_prefix      = "0.0.0.0/0"
  next_hop_type       = "Internet"
}

resource "azurerm_route" "training-AzureMLRoute" {
  name                = "AzureMLRoute"
  resource_group_name = var.resource_group_name
  route_table_name    = azurerm_route_table.rt-training.name
  address_prefix      = "AzureMachineLearning"
  next_hop_type       = "Internet"
}

resource "azurerm_route" "training-BatchRoute" {
  name                = "BatchRoute"
  resource_group_name = var.resource_group_name
  route_table_name    = azurerm_route_table.rt-training.name
  address_prefix      = "BatchNodeManagement"
  next_hop_type       = "Internet"
}

# resource "azurerm_subnet_route_table_association" "rt-training-link" {
#   subnet_id      = azurerm_subnet.snet-training.id
#   route_table_id = azurerm_route_table.rt-training.id
# }
