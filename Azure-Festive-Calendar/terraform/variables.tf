variable "location" {
  type        = string
  description = "Default resources location"
}

variable "storage_account_name" {
  type        = string
  description = "Storage account name"
}

variable "resource_group_name" {
  type        = string
  description = "Storage account name"
}

variable "sa_web_source" {
  type        = string
  description = "Source Index Web Page Location"
}

variable "tag" {
  type        = string
  description = "Azure Resource Tags"
}

variable "vnet_name" {
  type        = string
  description = "Vnet Name"
}

variable "subnet_1_name" {
  type        = string
  description = "Subnet 1 Name"
}

variable "subnet_1_address_prefix" {
  type        = string
  description = "Subnet 1 Address Prefix"
}

variable "subnet_2_name" {
  type        = string
  description = "Subnet 2 Name"
}

variable "subnet_2_address_prefix" {
  type        = string
  description = "Subnet 2 Address Prefix"
}

