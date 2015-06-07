#!/bin/sh
sudo apt-get install -y g++ curl libssl-dev apache2-utils

git clone git://github.com/ry/node.git ~/node
cd ~/node
./configure
make
sudo make install
