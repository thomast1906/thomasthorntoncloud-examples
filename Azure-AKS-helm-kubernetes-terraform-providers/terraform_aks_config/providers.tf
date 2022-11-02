provider "helm" {
  kubernetes {
    config_path = "/home/vsts/.kube/config"
  }
}

provider "kubernetes" {
  config_path    = "/home/vsts/.kube/config"
  config_context = "tamopsakstest-admin"
}

terraform {
  backend "azurerm" {
  }
}