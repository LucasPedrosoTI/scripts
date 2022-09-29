#!/bin/bash

echo "Removing Games"
sudo apt remove -y aisleriot gnome-mahjongg gnome-mines gnome-sudoku 

echo "Removing Transmission, Thunderbird, Rhythmbox, and libreoffice programs"
sudo apt-get purge -y transmission* thunderbird* rhythmbox* libreoffice*

echo "Cleaning and removing unnecessary libs"
sudo apt clean && sudo apt autoremove -y

echo "Upgrading programs"
sudo apt update -y && sudo apt upgrade -y

echo "Installing fonts, gnome extensions, gpaste and presetup for Brave browser"
sudo apt install apt-transport-https curl build-essential linux-headers-$(uname -r) gnome-shell-extensions gnome-shell-extensions-gpaste gnome-shell-extension-gpaste fonts-firacode -y

echo "Installing Slack, VS Code and Postman"
sudo snap refresh
sudo snap install slack --classic
sudo snap install code --classic
sudo snap install postman

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

echo "Installing Brave Browser"
sudo apt update && sudo apt install brave-browser -y

echo "Setting up aliases..."
echo 'alias cl=clear' >> ~/.bashrc 

echo "Installing and setting up oh my posh"
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh
mkdir ~/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.omp.*
rm ~/.poshthemes/themes.zip
oh-my-posh font install FiraCode
fc-cache -fv
echo 'eval "$(oh-my-posh init bash --config ~/.poshthemes/1_shell.omp.json)"' >> ~/.bashrc

while true; do

read -p "Do you want to Setup Vboxvideo and display? (yes/no) " yn

case $yn in 
	[yY] ) echo "Setting Up VBox";
		sudo bash -c 'echo vboxvideo >> /etc/modules'
		echo 'xrandr --newmode "2560x1080_60.00"  230.00  2560 2720 2992 3424  1080 1083 1093 1120 -hsync +vsync
xrandr --addmode XWAYLAND0 "2560x1080_60.00"
xrandr --output XWAYLAND0 --mode "2560x1080_60.00"' >> ~/.profile;
		echo "If running on VirtualBox, please install the virtualbox guest additions and restart";
		break;;
	[nN] ) echo ok, Finished;
		exit;;
	* ) echo invalid response;;
esac

done
