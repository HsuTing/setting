#!/bin/bash

. ~/setting/setting.sh

print_title() {
  printf "${greenBg} $1 ${nocolorBg}\n"
}

print_command () {
  printf "${blue}● $1${nocolor}\n"
}

exec_command () {
  print_command "$1"
  $2
}

install_command() {
  if ! type "sudo" > /dev/null 2>&1; then
    $@
  else
    sudo $@
  fi
}

error() {
  printf "${red}✘  $1${nocolor}\n"
}

ok() {
  printf "${green}✔${nocolor}  $1\n"
}

check_command () {
  if ! type "$1" > /dev/null 2>&1; then
    case $system in
      ($linux)
        exec_command \
        "install $1" \
        "install_command apt install -y $1"
        ;;

      ($mac)
        exec_command \
        "install $1" \
        "brew install $1"
        ;;
    esac
  else
    ok $1
  fi
}

check_command_exist() {
  if ! type "$@" > /dev/null 2>&1; then
    error $1
  else
    ok $1
  fi
}

check_folder_exist() {
  if [ ! -e "$@" ]; then
    error $1
  else
    ok $1
  fi
}

check_file_exist() {
  if [ ! -f "$@" ]; then
    error $1
  else
    ok $1
  fi
}
