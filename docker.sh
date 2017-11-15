#!/bin/bash

. ~/setting/setting.sh
. ~/setting/command.sh

if ! type "docker" > /dev/null 2>&1; then
  case $system in
    ($linux)
      print_command \
      "install docker"

      install_command apt install -y \
      apt-transport-https \
      ca-certificates \
      curl \
      software-properties-common

      curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
      apt-key fingerprint 0EBFCD88

      install_command add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) \
      stable"

      install_command apt update
      install_command apt -f -y install

      install_command apt install -y docker-ce
      ;;
    ($mac)
      print_command \
      "install docker: https://store.docker.com/editions/community/docker-ce-desktop-mac?tab=description"
      ;;
  esac
fi

check_command_exist docker
