$environmentVariable = @{}
$environmentVariable["AZP_URL"] = 'https://dev.azure.com/devops-workshop-3' #$QueueItem["planUri"]
$environmentVariable["AZP_TOKEN"] = 'perddqgf7mqeuh6wlh2g7edx5mi5l4dcn3gdqci3n4hikqkzfthq'
$environmentVariable["AZP_POOL"] = 'Default'
$environmentVariable["AZP_AGENT_NAME"] = 'CustomBuildAgent'

$container = New-AzContainerInstanceObject -Name 'custom-build-agent' -Image 'acrondemagents.azurecr.io/azure-devops/agent/dotnet/sdk:6.0' `
    -LimitCpu 2 -LimitMemoryInGb 2.5 -EnvironmentVariable $environmentVariable
$password = ConvertTo-SecureString 'fpbbJi8mdCGLk8XYv5/R9KL5kweZXqvd' -AsPlainText -Force
$imageRegistryCredential = New-AzContainerGroupImageRegistryCredentialObject -Server "acrondemagents.azurecr.io" -Username "acrondemagents" -Password $password 
$containerGroup = New-AzContainerGroup -ResourceGroupName "rg-azuredevops" -Location westeurope -Name acg-ondemagents -SubscriptionId fb53562b-9267-40fa-b628-04514a974b42 `
    -OsType Linux ` -Container $container -ImageRegistryCredential $imageRegistryCredential -IpAddressType Public -RestartPolicy Never

Write-Host "Azure Containe Group created. Name: " $containerGroup.Name