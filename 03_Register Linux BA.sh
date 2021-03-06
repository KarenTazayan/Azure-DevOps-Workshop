# Install Docker on Linux BA

# First, update your existing list of packages
sudo apt update
# Next, install a few prerequisite packages which let apt use packages over HTTPS:
sudo apt install apt-transport-https ca-certificates curl software-properties-common
# Then add the GPG key for the official Docker repository to your system:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# Add the Docker repository to APT sources:
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
# Next, update the package database with the Docker packages from the newly added repo:
sudo apt update
sudo apt install docker-ce # (Check that it’s running: $ sudo systemctl status docker)

# Install Docker Compose
sudo curl -L https://github.com/docker/compose/releases/download/1.29.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
# Verify that the installation was successful by checking the version: $ docker-compose --version
sudo usermod -aG docker $USER

# Register Linux BA

# Create new pool, Name: Linux Pipeline
# URL: https://dev.azure.com/devops-workshop-4/_settings/agentpools
# Download Agent files
# URL: https://vstsagentpackage.azureedge.net/agent/2.196.2/vsts-agent-linux-x64-2.196.2.tar.gz
mkdir myagent && cd myagent
tar zxvf ../vsts-agent-linux-x64-2.196.2.tar.gz
./config.sh
# Run as a systemd service
sudo ./svc.sh install
sudo ./svc.sh start