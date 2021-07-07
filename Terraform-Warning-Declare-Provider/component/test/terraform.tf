module "storageaccount" {

  providers = {
    azurerm               = azurerm
    azurerm.storageaccount = azurerm.storageaccount_nonprod
  }

  source                  = "../../modules/storageaccount"
}