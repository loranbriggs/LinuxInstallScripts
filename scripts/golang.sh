#!/bin/sh
sudo apt-get install gcc libc6-dev -y                     # c tools
git clone https://go.googlesource.com/go ~/gosrc          # get the src code
echo -e "\nexport GOROOT=\$HOME/gosrc" >> ~/.bashrc       # set GOROOT
echo -e "export PATH=\$PATH:\$GOROOT/bin" >> ~/.bashrc
mkdir ~/go
echo -e "export GOPATH=\$HOME/go" >> ~/.bashrc          # set GOPATH
echo -e "export PATH=\$PATH:\$GOPATH/bin" >> ~/.bashrc
. ~/.bashrc
cd $GOROOT
git checkout go1.4.1                                      # checkout v 1.4.1
cd src
./all.bash                                                # compile source code
echo -e "GOROOT and GOPATH configured in .bashrc"
echo -e "lets test the installation...\n"
cd $GOPATH
echo -e "package main\n\nimport \"fmt\"\n\nfunc main() {\n\tfmt.Print(\"hello, go\\\n\")\n}" >> hello.go
go run hello.go
