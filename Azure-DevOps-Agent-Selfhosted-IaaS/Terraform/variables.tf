variable "rg_name" {
  type = string
}

variable "location" {
  type    = string
  default = "uksouth"
}

variable "vnet_name" {
  type = string
}

variable "vnet_ip_address" {
  type = list(string)
}

variable "subnet_name_ado_agent" {
  type = string
}

variable "subnet_name_ado_agent_address" {
  type = string
}

variable "key_vault_name" {
  type = string
}

variable "vm_name" {
  type = string
}

variable "vm_private_ip_address" {
  type = string
}

variable "vm_pip_name" {
  type = string
}

variable "vm_username" {
  type = string
}

variable "vm_osdisk_name" {
  type = string
}

variable "nsg_name" {
  type = string
}