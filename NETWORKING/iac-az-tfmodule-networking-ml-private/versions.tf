terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.10.0"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "2.1.0"
    }
  }

}

provider "azurerm" {
  features {}
}