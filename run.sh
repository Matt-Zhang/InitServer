#!/bin/bash

# zsh
apt-get update

echo "Install ZSH..."
cd zsh
bash -x run.sh
cd ..

#vim
cp .vimrc ~/.vimrc

# docker
# set to stable repo
curl -fsSL https://yum.dockerproject.org/gpg | sudo apt-key add -
apt-get install software-properties-common
add-apt-repository "deb https://apt.dockerproject.org/repo/ubuntu-$(lsb_release -cs) main"
# replace docker-engine with docker.io because the former one does not exists
apt-get install docker.io
docker run hello-world

# python
apt-get install python-setuptools python-dev build-essential 
easy_install pip 
pip install --upgrade virtualenv 
