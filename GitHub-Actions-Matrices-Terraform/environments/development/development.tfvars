environment = "development"

virtual_network_address_space = "192.168.0.0/16"

private_dns_zones = [
    "privatelink.blob.core.windows.net", #blob
    "privatelink.azurewebsites.net", #webapp
  ]

virtual_network_subnets = [
  {
    name           = "web"
    address_prefix = "192.168.0.0/24"
    service_endpoints = [
      "Microsoft.KeyVault"]
    enable_pe_policy = true
  },
  {
    name           = "privateendpoints"
    address_prefix = "192.168.1.0/24"
    service_endpoints = ["Microsoft.KeyVault"]
    enable_pe_policy = false
  }
]


tags = {
  "DeployedBy" = "Terraform"
  "Environment" = "development"
}