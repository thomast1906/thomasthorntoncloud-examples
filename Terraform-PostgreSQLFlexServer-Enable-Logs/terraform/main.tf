provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "tamopsrg" {
  name     = "tamops-psql-logs"
  location = "UK South"
}

resource "azurerm_postgresql_flexible_server" "tamopspsql" {
  name                   = "tamops-psqlflexibleserver"
  resource_group_name    = azurerm_resource_group.tamopsrg.name
  location               = azurerm_resource_group.tamopsrg.location
  version                = "15"
  administrator_login    = "psqladmin"
  administrator_password = "H@Sh1CoR3!"
  zone                   = "2"

  storage_mb = 32768

  sku_name = "GP_Standard_D4s_v3"
}