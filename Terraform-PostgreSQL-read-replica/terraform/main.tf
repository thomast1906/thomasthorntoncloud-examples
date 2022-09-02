resource "azurerm_resource_group" "rg" {
  name     = "tamops-postgres"
  location = "West Europe"
}

resource "azurerm_postgresql_server" "postgresserver" {
  name                = "postgresql-tamops"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku_name = "B_Gen5_2"

  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true

  administrator_login          = "psqladmin"
  administrator_login_password = "H@Sh1CoR3!"
  version                      = "9.5"
  ssl_enforcement_enabled      = true
}

resource "azurerm_postgresql_database" "db" {
  name                = "dbtest"
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_postgresql_server.postgresserver.name
  charset             = "UTF8"
  collation           = "en-GB"
}

resource "azurerm_postgresql_server" "replica" {
  name                = "postgresql-replica"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku_name = "B_Gen5_2"

  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true

  administrator_login          = "psqladmin"
  administrator_login_password = "H@Sh1CoR3!"
  version                      = "9.5"
  ssl_enforcement_enabled      = true

  create_mode               = "Replica"
  creation_source_server_id = azurerm_postgresql_server.postgresserver.id

}

