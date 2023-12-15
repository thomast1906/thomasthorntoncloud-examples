provider "azurerm" {
  version = "3.85.0"
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