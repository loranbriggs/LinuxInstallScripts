#!/bin/sh
sudo apt-get install vim vim-gnome -y
read -p "Do you wish to install Loran Briggs' vim configuration? (y/n) " yn
    case $yn in
        [Yy]* ) 
		git clone https://github.com/loranbriggs/.vim.git ~/.vim
		git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
		ln -s ~/.vim/vimrc ~/.vimrc
		exit;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes (y) or no (n).";;
    esac

