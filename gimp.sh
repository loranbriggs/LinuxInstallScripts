#!/bin/sh
echo -ne '\n' | sudo add-apt-repository ppa:otto-kesselgulasch/gimp
sudo apt-get update
sudo apt-get install gimp -y
