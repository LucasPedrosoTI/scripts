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
git config --global alias.sh stash
git config --global alias.sw switch

# Alias to list all saved alias
git config --global alias.alias "!git config --get-regexp ^alias\."