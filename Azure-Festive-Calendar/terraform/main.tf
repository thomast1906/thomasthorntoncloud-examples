provider "azurerm" {
    # The "feature" block is required for AzureRM provider 2.x.
    # If you're using version 1.x, the "features" block is not allowed.
    version = "~> 3.0"
    features {}
}

data "azurerm_client_config" "current" {}

terraform {
    backend "azurerm" {
        resource_group_name = "tamopstf"    
        storage_account_name = "tfstatedevops"
        container_name = "azurefestivecalendar"
    }
}

# Create Resource Group
resource "azurerm_resource_group" "tamops" {
  name     = var.resource_group_name
  location = var.location 

  tags = {
      Environment = var.tag
    }

}

# Create Storage account
resource "azurerm_storage_account" "storage_account" {
  name                = var.storage_account_name
  resource_group_name = azurerm_resource_group.tamops.name

  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"

  tags = {
      Environment = var.tag
    }

}

# Add index.html to blob storage
resource "azurerm_storage_blob" "example_blob" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source                 = var.sa_web_source
}

# Add Virtual Network
resource "azurerm_virtual_network" "example_vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.tamops.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4","10.0.0.5", "10.0.0.6","10.0.0.7","10.0.0.8"]


  subnet {
    name           = var.subnet_1_name
    address_prefix = var.subnet_1_address_prefix
  }

  subnet {
    name           = var.subnet_2_name
    address_prefix = var.subnet_2_address_prefix
  }

 tags = {
      Environment = var.tag
    }
}