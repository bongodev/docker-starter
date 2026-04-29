#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Starting Docker Compose V2 installation..."

# 1. Update the package index and install prerequisites
echo "Updating package index and installing dependencies..."
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg

# 2. Add Docker's official GPG key
echo "Adding Docker's GPG key..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# 3. Set up the repository
echo "Adding Docker repository to Apt sources..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 4. Install Docker Compose Plugin
echo " Installing docker-compose-plugin..."
sudo apt-get update
sudo apt-get install -y docker-compose-plugin

# 5. Verify installation
echo "✅ Installation complete! Verifying version..."
docker compose version

echo "🏁 You're all set. Use 'docker compose' (without the hyphen) to run your commands."
