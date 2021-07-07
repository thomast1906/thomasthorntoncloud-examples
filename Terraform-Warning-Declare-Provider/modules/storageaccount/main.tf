data "azurerm_resource_group" "tamopsrg" {
provider = azurerm.storageaccount
  name     = "tamops"
}

# Create Storage Account
resource "azurerm_storage_account" "tamopssa" {
  name                     = "thaoartowqer"
  resource_group_name      = data.azurerm_resource_group.tamopsrg.name
  location                 = data.azurerm_resource_group.tamopsrg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}