#!/bin/bash

source ./ubuntu-presetup-and-cleanup.sh

source ./set-env-variables.sh
source ./set-aliases.sh

echo 'export PATH="$PATH:/home/$USER/indeed/scripts:/home/$USER/.local/share/JetBrains/Toolbox/scripts"' >> ~/.bashrc

source ./run-indeed-setup.sh