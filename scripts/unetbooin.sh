#!/bin/sh
echo -ne '\n' | sudo add-apt-repository ppa:gezakovacs/ppa
sudo apt-get update
sudo apt-get install unetbootin -y
