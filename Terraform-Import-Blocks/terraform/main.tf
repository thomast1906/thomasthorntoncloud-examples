import {

  id = "/subscriptions/04109105-f3ca-44ac-a3a7-66b4936112c3/resourceGroups/examplerg"
  to = azurerm_resource_group.resource_group

}

import {

  id = "/subscriptions/04109105-f3ca-44ac-a3a7-66b4936112c3/resourceGroups/examplerg/providers/Microsoft.Network/privateDnsZones/thomasthornton.cloud"
  to = azurerm_private_dns_zone.dns_zone

}

import {

  id = "/subscriptions/04109105-f3ca-44ac-a3a7-66b4936112c3/resourceGroups/examplerg/providers/Microsoft.Network/privateDnsZones/thomasthornton.cloud/A/example"
  to = azurerm_private_dns_a_record.a_record

}