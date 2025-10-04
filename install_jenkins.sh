#!/bin/bash
# Simple script to install Jenkins on Ubuntu

set -e  # Exit immediately if a command exits with a non-zero status

echo "=== Adding Jenkins repository key ==="
sudo mkdir -p /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian/jenkins.io-2023.key

echo "=== Adding Jenkins repository ==="
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "=== Updating package list ==="
sudo apt-get update -y

echo "=== Installing Java (OpenJDK 17) ==="
sudo apt-get install -y fontconfig openjdk-17-jre

echo "=== Installing Jenkins ==="
sudo apt-get install -y jenkins

echo "=== Jenkins installation complete! ==="
echo "You can start Jenkins with: sudo systemctl start jenkins"
echo "Then check status using: sudo systemctl status jenkins"
