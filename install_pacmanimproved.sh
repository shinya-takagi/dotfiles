#!/bin/bash

#-----Pacman base-devel--------->
#sudo pacman -S base-devel

# Referrence : https://haiju.hatenablog.com/entry/2018/12/14/131830 
#-----Install yay--------------->
cd ~
if [ ! -e /usr/bin/git ]; then
    pacman -S --needed git base-devel
fi
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
#-----yay------------<

#-----Install Powerpill(parallel pacman)-------->
cd ~
yay -S powerpill
yay --save --pacman powerpill
# Referrence(yay, Powerpill : https://zenn.dev/nazo6/scraps/879349bcab4c10
#-----Powerpill------<
