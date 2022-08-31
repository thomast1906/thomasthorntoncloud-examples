variable "aca_name" {
  type        = string
  description = "Name for Azure Container App"
}
variable "location" {
  default     = "uksouth"
  type        = string
  description = "Location of Azure resources"
}