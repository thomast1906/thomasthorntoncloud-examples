variable "environment" {
  description = "The environment for the resources"
  type        = string
  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "Environment must be one of 'dev', 'test', or 'prod'."
  }
}

variable "rg_name" {
  type        = string
  description = "Name of the Azure resource group"
  validation {
    condition     = can(regex("^rg-tamops", var.rg_name))
    error_message = "Resource group name must start with 'rg-tamops'."
  }
}
