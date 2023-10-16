variable "sa_create" {
  type    = bool
  default = "false"
}

resource "azurerm_resource_group" "rg" {
  name     = "tamops-resources"
  location = "Uk South"
}

resource "azurerm_storage_account" "sa" {
  count                    = var.sa_create ? 1 : 0
  name                     = "tamopssa"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}