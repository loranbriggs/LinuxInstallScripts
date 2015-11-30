#!/bin/sh
echo -e "GOROOT and GOPATH configured in .bashrc"
echo -e "lets test the installation...\n"
cd $GOPATH
echo -e "package main\n\nimport \"fmt\"\n\nfunc main() {\n\tfmt.Print(\"hello, go\\\n\")\n}" >> hello.go
go run hello.go




#!/bin/sh
OLDGO="$HOME/go1.4"
GOSRC="$HOME/go"
WORKSPACE="$HOME/goworkspace"

sudo apt-get install gcc libc6-dev -y                     # c tools

# Build Go 1.4 to bootstrap 1.5+
git clone https://go.googlesource.com/go $OLDGO
cd $OLDGO
git checkout go1.4.1
cd src
./all.bash                                                # compile go1.4
GOROOT_BOOTSTRAP=$OLDGO

# Now for Latest Go
git clone https://go.googlesource.com/go $GOSRC               # get the src code again...
cd $GOSRC
LATEST=$(git tag | grep "go[0-9].[0-9].[0-9]" | tail -1)    # latest version
git checkout $LATEST
cd src
./all.bash                                                  # compile source code

# Setup Go Enviroment
mkdir $WORKSPACE
echo "# Go setup" >> ~/.bashrc
echo "export GOROOT=$GOSRC" >> ~/.bashrc                # set GOROOT
echo "export PATH=\$PATH:\$GOROOT/bin" >> ~/.bashrc
echo "export GOPATH=$WORKSPACE" >> ~/.bashrc       # set GOPATH
echo "export PATH=\$PATH:\$GOPATH/bin" >> ~/.bashrc
. ~/.bashrc
echo "GOROOT and GOPATH configured in .bashrc"
echo "lets test the installation...\n"
cd $WORKSPACE
echo -e "package main\n\nimport \"fmt\"\n\nfunc main() {\n\tfmt.Print(\"hello, go\\\n\")\n}" >> hello.go
go run hello.go
