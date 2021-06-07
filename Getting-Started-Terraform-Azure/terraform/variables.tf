variable "location" {
  type        = string
  default     = "UK South"
  description = "default resources location"
}

variable "resource_group_name" {
  type        = string
  description = "resource group name"
}

variable "storage_account_name" {
  type        = string
  description = "storage account name"
}