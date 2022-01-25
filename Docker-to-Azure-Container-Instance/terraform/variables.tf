variable "rg_name" {
  type        = string
  description = "Resource Group name to where resources are going to be deployed"
}
variable "acr_name" {
  type        = string
  description = "Azure Container Registry name"
}

variable "location" {
  type        = string
  description = "Location of Azure resources"
}

variable "build_id" {
  type        = string
  description = "Build ID of Azure DevOps Pipeline"
}
