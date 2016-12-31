#!/bin/bash

if ! type "brew" > /dev/null 2>&1; then
  ## add brew
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  brew install readline
  brew install tree
  brew install bash-completion
fi
