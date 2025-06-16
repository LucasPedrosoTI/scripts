#!/bin/bash

source ./ubuntu-presetup-and-cleanup.sh

source ./set-env-variables.sh
source ./set-aliases.sh

echo 'export PATH="$PATH:/home/iam_lpsantos/indeed/scripts:/home/iam_lpsantos/.local/share/JetBrains/Toolbox/scripts"' >> ~/.bashrc

wget -N https://boxy.sandbox.indeed.net/bootstrap -O /tmp/system-setup ; bash /tmp/system-setup