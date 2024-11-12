variable "location" {
  description = "Location for the resources"
  type        = string
  default     = "uksouth"
}

variable "rg_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "tamops-rg"
}

variable "vnet_address_space" {
  description = "Address space for the VNet"
  type        = string
  default     = "192.168.0.0/24"
}