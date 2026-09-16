terraform {
  required_version = ">= 1.0.10"

  backend "local" {
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.117.1"
    }
  }
}

provider "azurerm" {
  features {}
}