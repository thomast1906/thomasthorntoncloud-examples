provider "azurerm" {
  version = "~> 3.0"
  features {}
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

provider "azapi" {
}