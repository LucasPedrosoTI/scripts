#!/bin/bash

# Install non automatically installed apps
echo "Installing non automatically installed apps..."
indeed_apps=(
    "slack"
    "cursor"
    "zoom"
)

for app in "${indeed_apps[@]}"; do
    echo "Installing $app..."
    brew install --cask $app
done

# Run the indeed setup
source ./run-indeed-setup.sh