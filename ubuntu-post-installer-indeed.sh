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