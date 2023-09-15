variable "location" {
  default = "uksouth"
}

variable "environment" {
}

variable "instance_number" {
  default = "001"
}

variable "region" {
  default = "uks"
}

variable "tags" {
  type = map(string)
}

variable "virtual_network_subnets" {
  type    = any
  default = []
}

variable "private_dns_zones" {
  type    = any
  default = []
}

variable "virtual_network_address_space" {
}

variable "deployment_subscription_id" {
}