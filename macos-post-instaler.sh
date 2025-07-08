#!/bin/bash

# Setup git aliases
source ./setup-git-aliases.sh

echo "Installing apps..."
# Install apps
apps=(
    "warp"
    "brave-browser"
    "postman"
    "whatsapp"
    "spotify"
    "chatgpt"
    "bitwarden"
    "displaylink"
    "font-fira-code-nerd-font"
)

for app in "${apps[@]}"; do
    echo "Installing $app..."
    brew install --cask $app
done

# Install oh-my-posh
echo "Installing oh-my-posh..."
brew install oh-my-posh
echo 'eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/night-owl.omp.json)"' >> ~/.zshrc

# Indeed setup
read -p "Do you want to setup the environment for Indeed? (y/n): " should_install_indeed_apps

if [ "$should_install_indeed_apps" == "y" ]; then
    source ./set-env-variables.sh
    source ./set-aliases.sh
    source ./macos-indeed-setup.sh
fi

echo "Done! Restarting the terminal to apply the changes..."
exec zsh