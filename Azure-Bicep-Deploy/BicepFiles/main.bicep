
param location string = resourceGroup().location

var virtualNetwork = {
  name: 'tamopsvnet'
  location: location
  addressPrefixes: [
    '10.0.0.0/16'
    ]
  subnets: [
    {
      name: 'testsubnet1'
      properties: {
        addressPrefix: '10.0.0.0/24'
      }
    }
    {
      name: 'testsubnet2'
      properties: {
        addressPrefix: '10.0.1.0/24'
      }
    }
  ]
}

resource virtualnetwork 'Microsoft.Network/virtualNetworks@2020-06-01' = {
  name: virtualNetwork.name
  location: virtualNetwork.location
  properties: {
    addressSpace: {
      addressPrefixes: virtualNetwork.addressPrefixes
    }
    subnets: virtualNetwork.subnets
  }
}

