# jenkins_with_jdk17_full_installion
 sudo apt update && sudo apt upgrade -y
    2  sudo apt install openjdk-17-jdk -y
    3  java -version
    4  curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee   /usr/share/keyrings/jenkins-keyring.asc > /dev/null
    5  echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]   https://pkg.jenkins.io/debian-stable binary/ | sudo tee   /etc/apt/sources.list.d/jenkins.list > /dev/null
    6  sudo apt update
    7  sudo apt install jenkins -y
    8  sudo systemctl start jenkins
    9  sudo systemctl enable jenkins
   10  sudo systemctl status jenkins
