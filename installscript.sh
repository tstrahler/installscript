#!/bin/bash

# Remember exec dir
INSTALL_DIR=$(pwd)

# cd into home
cd $HOME

# Update system first
sudo apt update
sudo apt upgrade

# Install utilities
sudo apt install vim bat pandoc curl tldr flatpak inotify-tools

# Install software
sudo apt install geary firefox gimp textlive-full
sudo snap install drawio

# Install Tangram Browser
flatpak install flathub re.sonny.Tangram

# Install Uni VPN
sudo apt install openconnect network-manager-openconnect

# Modify all program configs
INPUTRC=~/.inputrc
echo '"\C-h": backward-kill-word' >> $INPUTRC

cat vimrc >> .vimrc
cat bashrc >> .bashrc
