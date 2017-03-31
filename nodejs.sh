#!/bin/bash

. setting.sh
. command.sh

case $system in
  ($linux)
    if ! type "yarn" > /dev/null 2>&1; then
      curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
      echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
      sudo apt-get update

      curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
      check_command nodejs
    fi
    ;;
esac

check_command npm
check_command yarn

# install packages
if ! type "yo" > /dev/null 2>&1; then
  exec_command \
  "install packages" \
  "yarn global add yo generator-cat create-react-native-app react-vr-cli"
else
  exec_command \
  "update packages" \
  "yarn global upgrade yo generator-cat create-react-native-app react-vr-cli"
fi
