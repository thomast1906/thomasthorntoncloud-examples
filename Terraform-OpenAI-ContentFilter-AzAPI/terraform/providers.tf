provider "azurerm" {
  features {}
}

provider "azapi" {
}

terraform {
  backend "local" {
  }

  required_providers {
    azapi = {
      source = "azure/azapi"
    }
  }
}