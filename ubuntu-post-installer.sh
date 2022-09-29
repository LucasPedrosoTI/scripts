#!/bin/bash

sudo apt install git nodejs npm default-jdk maven mysql-server -y 

git --version
git config --global user.name "LucasPedrosoTI"
git config --global user.email "lps1010@gmail.com"
git config --list

echo "Node version: "
node --version

echo "NPM version: "
npm --version
java -version
mvn -version

touch /etc/profile.d/maven.sh
echo "export JAVA_HOME=/usr/lib/jvm/default-java
export M2_HOME=/opt/maven 
export MAVEN_HOME=/opt/maven 
export PATH=${M2_HOME}/bin:${PATH}" > /etc/profile.d/maven.sh

sudo chmod +x /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh

sudo apt update
sudo apt upgrade
