variable "location" {
  default = "westeurope"
}

variable "resource_group_name" {
  type = string
}

variable "environment" {
}

variable "region" {
}

variable "instance_number" {
}

variable "sku" {
  default = "PerGB2018"
}

variable "retention_in_days" {
  default = 30
}

# Added if we ever need
variable "solution_plan_map" {
  description = "Specifies solutions to deploy to log analytics workspace"
  default = {
    # ContainerInsights= {
    #   product   = "OMSGallery/ContainerInsights"
    #   publisher = "Microsoft"
    # }
  }
  type = map(any)
}

variable "tags" {
  type = map(string)
  default = {
    environment = "dev"
  }
}