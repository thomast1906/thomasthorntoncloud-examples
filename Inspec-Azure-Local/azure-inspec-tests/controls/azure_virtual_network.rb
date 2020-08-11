resource_group = 'tamops'
virtual_network = 'tamops-vnet'
address_space   = '192.168.0.0/16'
subnet1         = 'subnet'


describe azurerm_virtual_network(resource_group: resource_group, name: virtual_network) do
    its('address_space') { should eq [address_space] }
    its('subnets') { should eq [subnet1] }

end