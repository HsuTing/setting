#!/bin/bash

. setting.sh

print_title() {
  printf "${green}# $1\n${nocolor}"
}

print_command () {
  printf "${blue}## $1\n${nocolor}"
}

exec_command () {
  print_command "$1"
  $2
}

install_command() {
  if [ ! type "sudo" > /dev/null 2>&1 ]; then
    $@
  else
    sudo $@
  fi
}

check_command () {
  if [ ! type "$1" > /dev/null 2>&1 ]; then
    case $system in
      ($linux)
        exec_command \
        "install $1" \
        "install_command apt-get install -y $1"
        ;;

      ($mac)
        exec_command \
        "install $1" \
        "brew install $1"
        ;;
    esac
  else
    printf "${cyan}[checker] command \"$1\" is right.${nocolor}\n"
  fi
}

check_command_string() {
  count=1
  for string in $@; do
    printf "${string}"
    if [ $count != $# ]; then
      printf " "
    fi
    count=$((count + 1))
  done
}

check_command_exist() {
  if [ ! type "$@" > /dev/null 2>&1 ]; then
    printf "${red}[checker] command not find: $(check_command_string $@).${nocolor}\n"
  else
    printf "${cyan}[checker] command \"$(check_command_string $@)\" is right.${nocolor}\n"
  fi
}

check_folder_exist() {
  if [ ! -e "$@" ]; then
    printf "${red}[checker] folder not find: $(check_command_string $@).${nocolor}\n"
  else
    printf "${cyan}[checker] folder \"$(check_command_string $@)\" exits.${nocolor}\n"
  fi
}

check_file_exist() {
  if [ ! -f "$@" ]; then
    printf "${red}[checker] file not find: $(check_command_string $@).${nocolor}\n"
  else
    printf "${cyan}[checker] file \"$(check_command_string $@)\" exits.${nocolor}\n"
  fi
}
