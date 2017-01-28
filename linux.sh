#!/bin/bash

. command.sh

check_command apache2
check_command tree
sudo chown -R $USER /var/www/html

## set tern for vim
cp ./tern-project /var/www/html/.tern-project

## install docker
if ! type "docker" > /dev/null 2>&1; then
  print_command \
  "Install docker"

  sudo apt-get install curl \
                       linux-image-extra-$(uname -r) \
                       linux-image-extra-virtual

  sudo apt-get install apt-transport-https \
                       ca-certificates

  curl -fsSL https://yum.dockerproject.org/gpg | sudo apt-key add -

  sudo add-apt-repository \
       "deb https://apt.dockerproject.org/repo/ \
        ubuntu-$(lsb_release -cs) \
        main"

  sudo apt-get update

  sudo apt-get -y install docker-engine
fi
