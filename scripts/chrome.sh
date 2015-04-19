#!/bin/sh
sudo apt-get install libxss1 libappindicator1 libindicator7 -y
wget -P ~/Downloads https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i ~/Downloads/google-chrome*.deb
