#!/bin/sh

#gonna need curl
sudo apt-get install curl

#set up pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle; curl -LSso ~/.vim/autoload/pathogen.vim     https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

echo "creating vim backup locations.."
mkdir ~/.vim
mkdir ~/.vim/backup

sudo  apt-get install vim-gui-common
sudo apt-get install vim-runtime

