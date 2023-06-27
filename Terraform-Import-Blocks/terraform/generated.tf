# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "/subscriptions/04109105-f3ca-44ac-a3a7-66b4936112c3/resourceGroups/examplerg"
resource "azurerm_resource_group" "resource_group" {
  location = "uksouth"
  name     = "examplerg"
  tags = {
    example1 = "tagvalue1"
    example2 = "tagvalue2"
  }
}

# __generated__ by Terraform from "/subscriptions/04109105-f3ca-44ac-a3a7-66b4936112c3/resourceGroups/examplerg/providers/Microsoft.Network/privateDnsZones/thomasthornton.cloud/A/example"
resource "azurerm_private_dns_a_record" "a_record" {
  name                = "example"
  records             = ["1.2.3.4"]
  resource_group_name = "examplerg"
  tags                = {}
  ttl                 = 3600
  zone_name           = "thomasthornton.cloud"
}

# __generated__ by Terraform from "/subscriptions/04109105-f3ca-44ac-a3a7-66b4936112c3/resourceGroups/examplerg/providers/Microsoft.Network/privateDnsZones/thomasthornton.cloud"
resource "azurerm_private_dns_zone" "dns_zone" {
  name                = "thomasthornton.cloud"
  resource_group_name = "examplerg"
  tags                = {}
  soa_record {
    email        = "azureprivatedns-host.microsoft.com"
    expire_time  = 2419200
    minimum_ttl  = 10
    refresh_time = 3600
    retry_time   = 300
    tags         = {}
    ttl          = 3600
  }
}
