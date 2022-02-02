# Download and install sqlpackage on Windows BA
# Check which arguments are available to run the MSI: $ Start-Process C:\sqlpackage.msi /?
# URL: https://docs.microsoft.com/en-us/sql/tools/sqlpackage/sqlpackage-download?view=sql-server-ver15
curl.exe -L --output sqlpackage.msi --url https://github.com/KarenTazayan/Azure-DevOps-Workshop/raw/main/Windows%20Pipeline/Install/DacFramework.msi
Start-Process C:\sqlpackage.msi -ArgumentList "/quiet"

# Register Windows BA

# Create new pool, Name: Windows Pipeline
# URL: https://dev.azure.com/devops-workshop-4/_settings/agentpools

# Connect to Windows BA
mkdir vsts-agent-win-x64-2.196.2
curl.exe --output c:\vsts-agent-win-x64-2.196.2\agent.zip --url https://vstsagentpackage.azureedge.net/agent/2.196.2/vsts-agent-win-x64-2.196.2.zip
cd c:\vsts-agent-win-x64-2.196.2
tar -xf agent.zip
.\config.cmd
