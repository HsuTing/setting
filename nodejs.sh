#!/bin/bash

. ~/setting/setting.sh
. ~/setting/command.sh

case $system in
  ($linux)
    if ! type "yarn" > /dev/null 2>&1; then
      curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | install_command apt-key add -
      echo "deb https://dl.yarnpkg.com/debian/ stable main" | install_command tee /etc/apt/sources.list.d/yarn.list

      curl -sL https://deb.nodesource.com/setup_7.x | install_command bash -
      install_command apt update
      check_command nodejs
      install_command apt install -y nodejs-legacy
    fi

    if ! type "watchman" > /dev/null 2>&1; then
      git clone https://github.com/facebook/watchman.git
      cd watchman
      git checkout v4.7.0  # the latest stable release
      ./autogen.sh
      ./configure
      make
      install_command make install
      cd ./../
      rm -rf ./watchman
    fi
    ;;
esac

check_command npm
check_command yarn
check_command watchman

# install packages
packages="yo \
  create-react-native-app \
  react-vr-cli \
  nsp \
  commitizen \
  cz-conventional-changelog \
  conventional-changelog \
  generator-cat \
  git-open \
  git+ssh://git@github.com:HsuTing/cat-bin.git"
if ! type "yo" > /dev/null 2>&1; then
  exec_command \
  "install packages" \
  "yarn global add $packages"
else
  exec_command \
  "update packages" \
  "yarn global upgrade $packages"
fi

cp ~/setting/nodejs/czrc ~/.czrc
check_file_exist ~/.czrc

check_command_exist yo
check_command_exist create-react-native-app
check_command_exist react-vr
check_command_exist nsp
check_command_exist git-cz
check_command_exist commitizen
check_command_exist conventional-changelog
check_command_exist cat-bin
