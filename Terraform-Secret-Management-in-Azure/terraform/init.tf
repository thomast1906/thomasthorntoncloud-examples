terraform {
  backend "local" {
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}