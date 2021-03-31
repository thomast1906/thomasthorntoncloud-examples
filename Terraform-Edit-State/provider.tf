terraform {
  required_version = ">= 0.13.0"
  backend "azure" {
    resource_group_name  = "tamopstfstates"
    storage_account_name = "tfstatedevops"
    container_name       = "terraformstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}