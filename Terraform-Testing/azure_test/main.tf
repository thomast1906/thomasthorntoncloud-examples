resource "azurerm_resource_group" "tamopsrg" {
  name     = "tamops-postgres"
  location = "Uk South"
}

resource "azurerm_postgresql_flexible_server" "tamopspsql" {
  name                   = "tamops-psqlflexibleserver"
  resource_group_name    = azurerm_resource_group.tamopsrg.name
  location               = azurerm_resource_group.tamopsrg.location
  version                = "16"
  administrator_login    = "thomas"
  administrator_password = "thomasthomas123!"
  zone                   = "2"

  storage_mb = 32768

  sku_name                     = "GP_Standard_D4s_v3"
  geo_redundant_backup_enabled = true
}

resource "azurerm_postgresql_flexible_server_database" "tamopspsqldb" {
  name      = "tamopsdb"
  server_id = azurerm_postgresql_flexible_server.tamopspsql.id
  collation = "en_US.utf8"
  charset   = "utf8"
}

resource "azurerm_postgresql_flexible_server" "tamopspsqlgeorestore" {
  name                              = "tamops-psqlgeorestore"
  resource_group_name               = azurerm_resource_group.tamopsrg.name
  location                          = "Uk West"
  version                           = "16"
  create_mode                       = "GeoRestore"
  source_server_id                  = azurerm_postgresql_flexible_server.tamopspsql.id
  point_in_time_restore_time_in_utc = timeadd(timestamp(), "5m") 
}