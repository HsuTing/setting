#!/bin/bash

. setting.sh
. command.sh

if ! type "docker" > /dev/null 2>&1; then
  case $system in
    ($linux)
      print_command \
      "Install docker"

      sudo apt-get install -y curl \
      linux-image-extra-$(uname -r) \
      linux-image-extra-virtual

      sudo apt-get install -y apt-transport-https \
      ca-certificates

      curl -fsSL https://yum.dockerproject.org/gpg | sudo apt-key add -

      sudo add-apt-repository \
      "deb https://apt.dockerproject.org/repo/ \
      ubuntu-$(lsb_release -cs) \
      main"

      sudo apt-get update

      sudo apt-get install -y docker-engine
      ;;
    ($mac)
      print_command \
      "Install docker: https://store.docker.com/editions/community/docker-ce-desktop-mac?tab=description"
      ;;
  esac
fi
