#!/bin/bash

sudo snap install dbeaver-ce -y

echo "alias gcb='gradle clean build'
alias v='lsb_release -a'
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
source <(kubectl completion bash)
alias k=kubectl
alias mk=minikube
alias gr=gradle
alias grl='gradle lockdown'
alias kadc='k --context="$KUBE_CONTEXT" -n "$KUBE_NAMESPACE" exec -c adcentral-cache "adcentral-cache-statefulset-$ADC_INDEX" --'
alias dc=docker" >> ~/.bashrc

wget -N https://boxy.sandbox.indeed.net/bootstrap -O /tmp/system-setup ; bash /tmp/system-setup

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