#!/bin/sh
sudo apt-get install git -y
read -p "Configuring git, what is your name? " name
git config --global user.name "$name"
read -p "What is your email? " email
git config --global user.email "$email"
git config --list
