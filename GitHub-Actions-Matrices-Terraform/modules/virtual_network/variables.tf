variable "location" {
  default = "westeurope"
}

variable "network_address_space" {
}

variable "resource_group_name" {
  type = string
}

variable "subnets" {
  type = any

  default = []
}

variable "environment" {
}

variable "region" {
}

variable "instance_number" {
}


variable "service_endpoints" {
  type = any

  default = []
}

variable "log_analytics_workspace_id" {
}

variable "log_analytics_retention_days" {
}

variable "tags" {
  type = map(string)
  default = {
    environment = "dev"
  }
}