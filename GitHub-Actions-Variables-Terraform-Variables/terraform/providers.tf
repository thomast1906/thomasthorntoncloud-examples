terraform {
  backend "azurerm" {
    resource_group_name  = "thomasthorntoncloud"
    storage_account_name = "thomasthorntontfstate"
    container_name       = "terraformgithubexample2"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

