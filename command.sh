#!/bin/bash

color="\033[0;34m"
nocolor="\033[0m"

print_sign() {
  printf "#"
  for (( i = 0; i < $1 + 4; i++ ))
  do
    printf "%s" "$2"
  done
  printf "#"
  echo
}

print_command () {
  printf "${color}\n"
  print_sign ${#1} "#"
  print_sign ${#1} " "
  printf "#  %s  #\n" "$1"
  print_sign ${#1} " "
  print_sign ${#1} "#"
  printf "${nocolor}\n"
}

exec_command () {
  printf "${color}\n"
  print_sign ${#1} "#"
  print_sign ${#1} " "
  printf "#  %s  #\n" "$1"
  print_sign ${#1} " "
  print_sign ${#1} "#"
  printf "${nocolor}\n"

  $2
}

check_command () {
  if ! type "$1" > /dev/null 2>&1; then
    case $system in
      ($linux)
        exec_command \
        "install $1" \
        "sudo apt-get install $1"
        ;;

      ($mac)
        exec_command \
        "install $1" \
        "brew install $1"
        ;;
    esac
  fi
}
