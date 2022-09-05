variable "aca_name" {
  type        = string
  description = "Name for Azure Container App"
}
variable "location" {
  default     = "uksouth"
  type        = string
  description = "Location of Azure resources"
}
variable "network_address_space" {
  default     = "uksouth"
  type        = string
  description = "Network address space of the vnet"
}
variable "aca_subnet_address_name" {
  default     = "uksouth"
  type        = string
  description = "Container App Subnet Name"
}
variable "aca_subnet_address_prefix" {
  default     = "uksouth"
  type        = string
  description = "Container App Subnet Address Prefix"
}