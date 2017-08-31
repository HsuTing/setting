#!/bin/bash

. ~/setting/setting.sh
. ~/setting/command.sh

case $system in
  ($linux)
    if ! type "yarn" > /dev/null 2>&1; then
      curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | install_command apt-key add -
      echo "deb https://dl.yarnpkg.com/debian/ stable main" | install_command tee /etc/apt/sources.list.d/yarn.list

      curl -sL https://deb.nodesource.com/setup_7.x | install_command bash -
      install_command apt-get update
      check_command nodejs
      install_command apt-get install -y nodejs-legacy
    fi
    ;;
esac

check_command npm
check_command yarn

# install packages
packages="yo \
  create-react-native-app \
  react-vr-cli \
  npm-check \
  generator-cat \
  https://github.com/HsuTing/cat-bin.git"
if ! type "yo" > /dev/null 2>&1; then
  exec_command \
  "install packages" \
  "yarn global add $packages"
else
  exec_command \
  "update packages" \
  "yarn global upgrade $packages"
fi

check_command_exist yo
check_command_exist create-react-native-app
check_command_exist react-vr
check_command_exist npm-check
