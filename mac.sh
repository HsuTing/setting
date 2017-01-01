#!/bin/bash

. command.sh

if ! type "brew" > /dev/null 2>&1; then
  print_command \
  "add other plugins"

  ## add brew
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  check_command readline
  check_command tree
  check_command bash-completion
fi
