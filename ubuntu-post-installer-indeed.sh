#!/bin/bash

source ./ubuntu-presetup-and-cleanup.sh

echo "alias gcb='gradle clean build'
alias v='lsb_release -a'
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
source <(kubectl completion bash)
alias k=kubectl
alias mk=minikube
alias gr=gradle
alias grl='gradle lockdown'
alias kadc='k --context="$KUBE_CONTEXT" -n "$KUBE_NAMESPACE" exec -c adcentral-cache "adcentral-cache-statefulset-$ADC_INDEX" --'
alias tf=terraform
alias ttqa='tokentamer savecreds --account=088738946235 --cloud-access-role=ct-bizplat-qa-admin --profile-name default --region us-east-2'
alias tfws='tf workspace'
alias warp='warp-cli'
alias wcon='warp-cli connect'
alias wst='warp-cli status'
alias wdcon='warp-cli disconnect'
alias tt=tokentamer
alias tt-rrl='tokentamer savecreds --account=657470066844 --cloud-access-role=ct-rep-revenue-ledger-qa-admin --profile-name default --region us-east-2'
alias tt-v-rrl='tokentamer view --account=657470066844 --cloud-access-role=ct-rep-revenue-ledger-qa-admin'
alias tt-ul='tokentamer savecreds --account=630449608630 --cloud-access-role=ct-usage-ledger-qa-admin --profile-name default --region us-east-2'
alias tt-v-ul='tokentamer view --account=630449608630 --cloud-access-role=ct-usage-ledger-qa-admin'
alias tt-al='tokentamer savecreds --account=381492078891 --cloud-access-role=ct-adjustments-ledger-qa-admin --profile-name default --region us-east-2'
alias tt-v-al='tokentamer view --account=381492078891 --cloud-access-role=ct-adjustments-ledger-qa-admin'
alias dc=docker
export LDAP_USERNAME=iam_lpsantos
export USER=${LDAP_USERNAME}
export SKIP_VALIDATION=1
export KUBE_CONTEXT=awscmhqa3
export KUBE_NAMESPACE=crm
export ADC_INDEX=0
export END_INDEX=1
export PATH="$PATH:/home/iam_lpsantos/indeed/scripts:/home/iam_lpsantos/.local/share/JetBrains/Toolbox/scripts"
export VAULT_ADDR="https://vault.indeed.tech"
export HARBOR_REGISTRY="harbor.indeed.tech"
" >> ~/.bashrc

wget -N https://boxy.sandbox.indeed.net/bootstrap -O /tmp/system-setup ; bash /tmp/system-setup