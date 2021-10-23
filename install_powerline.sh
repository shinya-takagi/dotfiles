#!/bin/bash

readonly ccfont=Cascadiacode
readonly fontdir=cccode

# install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# install Cascadia code for Powerline except Nerd fonts.
#wget https://github.com/microsoft/cascadia-code/releases/download/v2108.26/CascadiaCode-2108.26.zip -O ~/"$ccfont".zip
# Install Cascadia code for Powerline including Nerd fonts.
wget https://github.com/AaronFriel/nerd-fonts/releases/download/v2.1.0-rc.0/CaskaydiaCove.zip -O ~/"$ccfont".zip
cd ~/
mkdir "$fontdir"
mv "$ccfont".zip "$fontdir"
cd "$fontdir"
unzip "$ccfont".zip
