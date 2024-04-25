variable "environment" {
  description = "Environment (e.g production)"
}
variable "location" {
  description = "Azure region"
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
}

variable "subnet_name" {
  description = "Name of the subnet"
}

variable "subnet_address_prefix" {
  description = "Address prefix for the subnet"
}