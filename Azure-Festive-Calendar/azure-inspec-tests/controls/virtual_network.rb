resource_group  = 'azurefestive-production'
virtual_network = 'azurefestive-production-vnet'
address_space   = '10.0.0.0/16'
subnet_1_name   = 'azurefestive-subnet1'
subnet_2_name   = 'azurefestive-subnet2'
dns_server1     = '10.0.0.4'
dns_server2     = '10.0.0.5'
dns_server3     = '10.0.0.6'
dns_server4     = '10.0.0.7'
location       = 'uksouth'

control 'Virtual Network Tests For' do
    title virtual_network
    
    describe azure_virtual_network(resource_group: resource_group, name: virtual_network) do
        its('address_space') { should eq [address_space] }
        its('location') { should eq(location) }
        its('subnets') { should eq [subnet_2_name, subnet_1_name] }
        its('dns_servers') { should eq [dns_server1, dns_server2, dns_server3, dns_server4] }
    end 
    
end