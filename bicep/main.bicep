targetScope = 'subscription'

param location string = 'northeurope'
param prefix string = 'bictest'
param postfix string = '101'
param sku string = 'F2'
param adminEmail string

var baseName  = '${prefix}-${postfix}'
var resourceGroupName = 'rg-${baseName}'
var safeBaseName = '${prefix}${postfix}'

// Resource group

resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: location
}

// Fabric capacity

module fab './fabric_capacity.bicep' = {
  name: 'fab'
  scope: resourceGroup(rg.name)
  params: {
    baseName: safeBaseName
    location: location
    sku: sku
    adminEmail: adminEmail
  }
}
