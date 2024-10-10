#!/bin/bash

# Update and install prerequisites
sudo apt-get update
sudo apt-get install -y curl git mercurial make binutils bison gcc

# Install GVM (Go Version Manager)
bash < <(curl -sSL https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
source "$HOME/.gvm/scripts/gvm"

echo "Do the below steps separately"
source ~/.bashrc
# Install multiple versions of Go
gvm install go1.22
gvm install go1.23.1

# Set default Go version
gvm use go1.23.1 --default

# Verify installation
go version
