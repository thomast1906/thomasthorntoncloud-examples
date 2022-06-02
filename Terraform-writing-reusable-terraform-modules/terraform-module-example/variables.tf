variable "location" {
  type        = string
  description = "Location of Resources"
}

variable "vnet_name" {
  type        = string
  description = "Virtual Network Name"
}

variable "network_address_space" {
  type        = string
  description = "Virtual Network Address Space"
}

variable "aks_subnet_address_prefix" {
  type        = string
  description = "AKS Subnet Address Prefix"
}

variable "aks_subnet_address_name" {
  type        = string
  description = "AKS Subnet Name"
}

variable "appgw_subnet_address_prefix" {
  type        = string
  description = "AppGW Subnet Address Prefix"
}

variable "appgw_subnet_address_name" {
  type        = string
  description = "AppGW Subnet Name"
}

variable "environment" {
  type        = string
  description = "Environment"
}
