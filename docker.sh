#!/bin/bash

. setting.sh
. command.sh

if [ ! type "docker" > /dev/null 2>&1 ]; then
  case $system in
    ($linux)
      print_command \
      "install docker"

      install_command apt-get install -y curl \
      linux-image-extra-$(uname -r) \
      linux-image-extra-virtual

      install_command apt-get install -y apt-transport-https \
      ca-certificates

      curl -fsSL https://yum.dockerproject.org/gpg | install_command apt-key add -

      install_command add-apt-repository \
      "deb https://apt.dockerproject.org/repo/ \
      ubuntu-$(lsb_release -cs) \
      main"

      install_command apt-get update

      install_command apt-get install -y docker-engine
      ;;
    ($mac)
      print_command \
      "install docker: https://store.docker.com/editions/community/docker-ce-desktop-mac?tab=description"
      ;;
  esac
fi

check_command_exist docker
