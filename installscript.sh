#!/bin/bash

# Remember exec dir
INSTALL_DIR=$(pwd)

# cd into home
cd $HOME

# Update system first
sudo apt update
sudo apt upgrade

# Install utilities
sudo apt install vim bat pandoc texlive curl tldr

# Install software
sudo apt install geary

# Create temp rubbish directory for install
TEMP=$(pwd)/temp_install
mkdir $TEMP

# Configure bashrc
BASHRC=~/.bashrc
echo 'alias q="exit"' >> $(BASHRC)
echo 'alias bat="batcat"' >> $(BASHRC)
echo 'alias xo="xdg-open"' >> $(BASHRC)
echo 'alias lt="ls --tree"' >> $(BASHRC)

# Configure vimrc
VIMRC=/usr/share/vim/vimrc
# Insert 4 spaces instead of tabs
echo 'set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab' >> $(VIMRC)
echo 'filetype plugin indent on' >> $(VIMRC)
echo 'set tabstop=4' >> $(VIMRC)
echo 'set shiftwidth=4' >> $(VIMRC)
echo 'set expandtab' >> $(VIMRC)
# Allow for shift tab 
echo 'nnoremap <S-Tab> <<' >> $(VIMRC)
echo 'inoremap <S-Tab> <C-d>' >> $(VIMRC)
# Print relative line number
echo 'set number relativenumber' >> $(VIMRC)

# Install lsd instead of ls
URL_LSD=$(curl -s https://api.github.com/repos/Peltoche/lsd/releases | grep browser_download_url | grep 'amd64[.]deb' | head -n 1 | cut -d '"' -f 4)
wget $(URL_LSD) -O lsd.deb
sudo dpkg -i lsd.deb
echo 'alias ls="lsd"' >> $(BASHRC)
echo 'alias sl="ls"' >> $(BASHRC)

# Install Argos shell extension (fixed for 22.04)
git clone https://github.com/Coda-Coda/argos.git
cd $TEMP/argos
cp argos@pew.worldwidemann.com $HOME/.local/share/gnome-shell/extensions/
mkdir $HOME/.config/argos
cp $INSTALL_DIR/argos/* $HOME/.config/argos
