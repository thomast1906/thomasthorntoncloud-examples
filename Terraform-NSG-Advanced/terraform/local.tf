locals {
  nsgrules = {

    ssh-all = {
      name                       = "ssh-all"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_address_prefix      = "1.2.3.4/32"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    }

    rdp-bastion = {
      name                         = "rdp-bastion"
      priority                     = 101
      direction                    = "Inbound"
      access                       = "Allow"
      protocol                     = "Tcp"
      source_port_range            = "*"
      destination_port_range       = "3389"
      source_address_prefixes      = ["1.2.3.4/32", "5.6.7.8/32"]
      destination_address_prefixes = ["192.168.10.10/32", "192.168.10.11/32"]
    }

    http-https = {
      name                       = "http-https"
      priority                   = 102
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [80,443]
      source_address_prefixes    = ["1.2.3.4/32", "5.6.7.8/32"]
      destination_address_prefix = "AzureLoadBalancer"
    }

    dns-tcp = {
      name                       = "dns-tcp"
      priority                   = 100
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range    = "53"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }

    dns-udp = {
      name                       = "dns-tcp"
      priority                   = 101
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range    = "53"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }

  }

}