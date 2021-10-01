provider "azurerm" {
    version = "~> 2.0"
    features {}
}

terraform {
    backend "local" {
    }
}

module "acr" {
  source   = "./modules/acr"
  name     = "tamopsblog"
  environment = "Production"
}

module "acr2" {
  source   = "./modules/acr"
  name     = "tamops2"
  environment = "Production"
}

module "acr3" {
  source   = "./modules/acr"
  name     = "tamops3"
  environment = "Production"
}