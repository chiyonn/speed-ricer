#!/bin/sh

sudo pacman -S git
sudo pacman -S fakeroot
sudo pacman -S binutils
sudo pacman -S make
sudo pacman -S gcc

git clone https://aur.archlinux.org/yay.git $HOME/.config/
cd $HOME/.config/yay
makepkg -si
