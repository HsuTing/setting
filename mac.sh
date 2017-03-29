#!/bin/bash

. command.sh

check_command tree
if [ ! -f $(brew --prefix)/etc/bash_completion ]; then
  check_command bash-completion
fi

## set tern for vim
cp ~/setting/vim/tern-project /Library/WebServer/Documents/.tern-project
