provider "azurerm" {
    version = "~> 2.0"
    features {}
}

terraform {
    backend "azurerm" {
      resource_group_name = "platopsacad-tf-rg"   
      storage_account_name = "platopsacadazuredevops"
      container_name = "terraform.tfstate`"
    }
}

data "azurerm_client_config" "current" {}