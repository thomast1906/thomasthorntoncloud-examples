resource_group = 'tamopsfail'

control 'azurerm_resource_groups' do
  describe azurerm_resource_groups.where(name: resource_group) do
    it               { should exist }
  end
end

