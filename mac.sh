#!/bin/bash

. command.sh

if ! type "brew" > /dev/null 2>&1; then
  print_command \
  "add other plugins"

  ## add brew
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  brew install readline
  brew install tree
  brew install bash-completion
fi
