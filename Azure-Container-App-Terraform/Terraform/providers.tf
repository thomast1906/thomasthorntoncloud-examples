terraform {
  backend "local" {
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.85.0"
    }
  }

}

provider "azurerm" {
  features {}
}
