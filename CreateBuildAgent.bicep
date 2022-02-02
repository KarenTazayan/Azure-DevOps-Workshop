@description('Name of container group name.')
param nameSuffix string = 'sc1'

var containerGroupName_var = 'acg-ondemagents${nameSuffix}'

resource containerGroupName 'Microsoft.ContainerInstance/containerGroups@2019-12-01' = {
  name: containerGroupName_var
  location: resourceGroup().location
  properties: {
    containers: [
      {
        name: 'custom-build-agent'
        properties: {
          image: 'acrondemagents.azurecr.io/azure-devops/agent/dotnet/sdk:6.0'
          resources: {
            requests: {
              cpu: 2
              memoryInGB: 4
            }
          }
          environmentVariables: [
            {
              name: 'AZP_URL'
              value: 'https://dev.azure.com/devops-workshop-3'
            }
            {
              name: 'AZP_TOKEN'
              value: 'perddqgf7mqeuh6wlh2g7edx5mi5l4dcn3gdqci3n4hikqkzfthq'
            }
            {
              name: 'AZP_POOL'
              value: 'Default'
            }
            {
              name: 'AZP_AGENT_NAME'
              value: 'CustomBuildAgent'
            }
          ]
        }
      }
    ]
    imageRegistryCredentials: [
      {
        server: 'acrondemagents.azurecr.io'
        username: 'acrondemagents'
        password: 'fpbbJi8mdCGLk8XYv5/R9KL5kweZXqvd'
      }
    ]
    osType: 'Linux'
  }
}
