terraform {
  backend "local" {
  }

  required_providers {
    azurerm = {
    }
  }
}

provider "azurerm" {
  features {}
}