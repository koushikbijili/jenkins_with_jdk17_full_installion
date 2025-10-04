#!/usr/bin/env bash
set -euo pipefail

LOGFILE="/var/log/install_jenkins.log"
exec > >(tee -a "$LOGFILE") 2>&1

# require sudo/root
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root (sudo). Exiting."
  exit 1
fi

export DEBIAN_FRONTEND=noninteractive

echo "----- $(date) : Updating packages -----"
apt update -y
apt upgrade -y

echo "----- $(date) : Installing OpenJDK 17 -----"
apt install -y openjdk-17-jdk

echo "Java version:"
java -version || true

echo "----- $(date) : Adding Jenkins repo key & source -----"
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key \
  | tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" \
  | tee /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "----- $(date) : Installing Jenkins -----"
apt update -y
apt install -y jenkins

echo "----- $(date) : Enabling & starting Jenkins -----"
systemctl enable --now jenkins

echo "----- $(date) : Firewall (UFW) - allow 8080 if ufw exists -----"
if command -v ufw >/dev/null 2>&1; then
  ufw allow 8080/tcp || true
fi

echo "----- $(date) : Final status -----"
systemctl status jenkins --no-pager || true

echo "Initial admin password (if present):"
if [ -f /var/lib/jenkins/secrets/initialAdminPassword ]; then
  cat /var/lib/jenkins/secrets/initialAdminPassword
else
  echo "Password file not found yet; check later."
fi

echo "Install finished. Check $LOGFILE for details."
