#!/bin/bash

sudo apt install git nodejs npm default-jdk maven mysql-server -y 

git --version
git config --global user.name "LucasPedrosoTI"
git config --global user.email "lps1010@gmail.com"
git config --list

echo "Configuring GIT aliases..."
# Custom git logging
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Add all and commit
git config --global alias.ac '!git add -A && git commit -m'

# git cherry-pick
git config --global alias.cp '!git cherry-pick'

# Setup short form of commands to save keystrokes
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.st status
git config --global alias.sw switch
git config --global alias.ps push
git config --global alias.pl pull
git config --global alias.rs reset

# Alias to list all saved alias
git config --global alias.alias "!git config --get-regexp ^alias\."

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
