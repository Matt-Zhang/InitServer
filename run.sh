#!/bin/bash

# zsh
apt-get update

echo "Install ZSH..."
cd zsh
bash -x run.sh

#vim
cp .vimrc ~/.vimrc


