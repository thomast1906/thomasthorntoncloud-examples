resource "azurerm_resource_group" "resource_group" {
  name     = "tamops-postgres"
  location = "West Europe"
}

resource "azurerm_postgresql_server" "postgresserver" {
  name                = "postgresql-tamops"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  sku_name = "B_Gen5_2"

  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true

  administrator_login          = "psqladmin"
  administrator_login_password = "H@Sh1CoR3!"
  version                      = "11"
  ssl_enforcement_enabled      = true
}

resource "azurerm_postgresql_database" "db" {
  name                = "dbtest"
  resource_group_name = azurerm_resource_group.resource_group.name
  server_name         = azurerm_postgresql_server.postgresserver.name
  charset             = "UTF8"
  collation           = "en-GB"
}

resource "azurerm_postgresql_server" "replica" {
  for_each = toset(var.replicas)

  name                = "postgresql-tamops-${each.key}"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  sku_name   = "B_Gen5_2"
  version    = "11"
  storage_mb = 5120

  backup_retention_days        = 7
  geo_redundant_backup_enabled = false

  ssl_enforcement_enabled = true

  administrator_login          = "psqladmin"
  administrator_login_password = "H@Sh1CoR3!"

  create_mode               = "Replica"
  creation_source_server_id = azurerm_postgresql_server.postgresserver.id
}
