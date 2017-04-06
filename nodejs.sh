#!/bin/bash

. ~/setting/setting.sh
. ~/setting/command.sh

case $system in
  ($linux)
    if ! type "yarn" > /dev/null 2>&1; then
      curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | install_command apt-key add -
      echo "deb https://dl.yarnpkg.com/debian/ stable main" | install_command tee /etc/apt/sources.list.d/yarn.list
      install_command apt-get update

      curl -sL https://deb.nodesource.com/setup_7.x | install_command bash -
      check_command nodejs
      check_command nodejs-legacy
    fi
    ;;
esac

check_command npm
check_command yarn

# install packages
if ! type "yo" > /dev/null 2>&1; then
  exec_command \
  "install packages" \
  "yarn global add yo create-react-native-app react-vr-cli"
  npm install -g generator-cat
else
  exec_command \
  "update packages" \
  "yarn global upgrade yo create-react-native-app react-vr-cli"
  npm install -g generator-cat
fi

check_command_exist yo
check_command_exist create-react-native-app
check_command_exist react-vr
