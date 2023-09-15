variable "resource_group_name" {
}

variable "azurerm_private_dns_zone_name" {
}

variable "virtual_networks_to_link" {
}

variable "tags" {
  type = map(string)
  default = {
    environment = "dev"
  }
}