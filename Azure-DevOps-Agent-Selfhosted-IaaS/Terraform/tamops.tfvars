# Create Resource Group
rg_name = "thomasthorntoncloud-ado-agent"

# Create Virtual Network
vnet_name                     = "thomasthorntoncloud-ado-agent-vnet"
vnet_ip_address               = ["192.168.0.0/16"]
subnet_name_ado_agent         = "ado-agent-subnet"
subnet_name_ado_agent_address = "192.168.0.0/24"

# Key Vault
key_vault_name = "thomasthorntoncloud-ado"

# Create Virtual Machine
vm_name               = "thomasthorntoncloud-ado-vm"
vm_private_ip_address = "192.168.0.4"
vm_pip_name           = "thomasthorntoncloud-ado-agent-pip"
vm_username           = "thomasthorntoncloud"
vm_osdisk_name        = "thomasthorntoncloud-ado-vm-osdisk"

# Network Security Group
nsg_name = "thomasthorntoncloud-ado-vm-nsg"