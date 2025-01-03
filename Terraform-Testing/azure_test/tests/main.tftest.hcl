# main.tftest.hcl

# Test resource group
run "verify_resource_group" {
  command = plan

  assert {
    condition     = azurerm_resource_group.tamopsrg.name == "tamops-postgres"
    error_message = "Resource group name does not match expected value"
  }

  assert {
    condition     = azurerm_resource_group.tamopsrg.location == "uksouth"
    error_message = "Resource group location does not match expected value"
  }
}

# Test PostgreSQL Flexible Server
run "verify_postgresql_server" {
  command = plan

  assert {
    condition     = azurerm_postgresql_flexible_server.tamopspsql.name == "tamops-psqlflexibleserver"
    error_message = "PostgreSQL server name does not match expected value"
  }

  assert {
    condition     = azurerm_postgresql_flexible_server.tamopspsql.version == "16"
    error_message = "PostgreSQL version does not match expected value"
  }

  assert {
    condition     = azurerm_postgresql_flexible_server.tamopspsql.zone == "2"
    error_message = "Availability zone does not match expected value"
  }

  assert {
    condition     = azurerm_postgresql_flexible_server.tamopspsql.storage_mb == 32768
    error_message = "Storage size does not match expected value"
  }

  assert {
    condition     = azurerm_postgresql_flexible_server.tamopspsql.sku_name == "GP_Standard_D4s_v3"
    error_message = "SKU name does not match expected value"
  }

  assert {
    condition     = azurerm_postgresql_flexible_server.tamopspsql.geo_redundant_backup_enabled == true
    error_message = "Geo-redundant backup setting does not match expected value"
  }
}

# Test PostgreSQL Database
run "verify_postgresql_database" {
  command = plan

  assert {
    condition     = azurerm_postgresql_flexible_server_database.tamopspsqldb.name == "tamopsdb"
    error_message = "Database name does not match expected value"
  }

  assert {
    condition     = azurerm_postgresql_flexible_server_database.tamopspsqldb.collation == "en_US.utf8"
    error_message = "Database collation does not match expected value"
  }

  assert {
    condition     = azurerm_postgresql_flexible_server_database.tamopspsqldb.charset == "utf8"
    error_message = "Database charset does not match expected value"
  }
}

# Test Geo-Restore Server
run "verify_postgresql_georestore" {
  command = plan

  assert {
    condition     = azurerm_postgresql_flexible_server.tamopspsqlgeorestore.name == "tamops-psqlgeorestore"
    error_message = "Geo-restore server name does not match expected value"
  }

  assert {
    condition     = azurerm_postgresql_flexible_server.tamopspsqlgeorestore.location == "ukwest"
    error_message = "Geo-restore server location does not match expected value"
  }

  assert {
    condition     = azurerm_postgresql_flexible_server.tamopspsqlgeorestore.create_mode == "GeoRestore"
    error_message = "Create mode does not match expected value"
  }
}
