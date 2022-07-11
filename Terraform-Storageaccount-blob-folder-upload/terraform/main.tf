resource "azurerm_resource_group" "tamopsrg" {
  name     = "tamopsdatarg"
  location = "uksouth"
}

resource "azurerm_storage_account" "tamopssa" {
  name                     = "tamopsdatasa"
  resource_group_name      = azurerm_resource_group.tamopsrg.name
  location                 = azurerm_resource_group.tamopsrg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tamopssacontainer" {
  name                  = "tamopsdata"
  storage_account_name  = azurerm_storage_account.tamopssa.name
  container_access_type = "blob"
}

resource "azurerm_storage_blob" "tamopsblobs" {
  for_each = fileset(path.module, "file_uploads/*")

  name                   = trim(each.key, "file_uploads/")
  storage_account_name   = azurerm_storage_account.tamopssa.name
  storage_container_name = azurerm_storage_container.tamopssacontainer.name
  type                   = "Block"
  source                 = each.key
  content_md5            = filemd5(each.key)
}
