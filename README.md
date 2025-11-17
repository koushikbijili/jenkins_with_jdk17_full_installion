# Jenkins with OpenJDK 17 Full Installation Script

This repository contains a **bash script** that automates the installation of Jenkins on Ubuntu (with OpenJDK 17).

## 🧩 What this script does

- Adds Jenkins’ official repository key and configures the apt source list.  
- Updates the package list.  
- Installs OpenJDK 17 (Java 17 runtime) as required by Jenkins.  
- Installs Jenkins.  
- Provides instructions to start and check the Jenkins service.

## 🧰 Usage

Run the following command on your Ubuntu server:

```bash
curl -fsSL https://raw.githubusercontent.com/koushikbijili/jenkins_with_jdk17_full_installion/refs/heads/main/install_jenkins.sh | sudo bash
````

After the script finishes:

* Start Jenkins:

  ```bash
  sudo systemctl start jenkins
  ```
* Check its status:

  ```bash
  sudo systemctl status jenkins
  ```
* Navigate to `http://<your_server_ip>:8080` in your browser to access Jenkins (default port).

## ✅ Pre-requisites

* An Ubuntu server (tested on Ubuntu 20.04/22.04).
* A user with `sudo` privileges.
* Internet access to download packages and repository metadata.

## 🔧 Post-installation Tips

* Once Jenkins is running, you’ll likely need to unlock Jenkins (check the initial admin password in `/var/lib/jenkins/secrets/initialAdminPassword`).
* Consider securing Jenkins by configuring a proper admin user, using HTTPS, and enabling firewall rules.
* Install desired plugins and create your first Jenkins job.
