#!/bin/sh

#gonna need curl
sudo apt-get install curl

#set up pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/plugin; curl -LSso ~/.vim/autoload/pathogen.vim     https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

echo "creating vim backup locations.."
mkdir ~/.vim
mkdir ~/.vim/backup
mkdir ~/.vim/tmp

sudo  apt-get install vim-gui-common
sudo apt-get install vim-runtime

