#!/bin/sh

if [ -f /etc/os-release ] && grep -q '^ID="arch"' /etc/os-release; then
  if ! command -v yay &>/dev/null; then
    if [ -f ./install_yay.sh ]; then
      ./install_yay.sh
    else
      echo "Error: install_yay.sh not found in the current directory."
      exit 1
    fi
  fi
	yay -S install brave-bin

elif grep -q '^ID="ubuntu"' /etc/os-release; then
	sudo apt install curl
	sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
	echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
	sudo apt update
	sudo apt install brave-browser

else
	echo "This OS has no script for install Brave yet."
fi
