#!/bin/bash

. ~/setting/command.sh

check_command tree
if [ ! -f $(brew --prefix)/etc/bash_completion ]; then
  check_command bash-completion
else
  check_file_exist $(brew --prefix)/etc/bash_completion
fi

## set tern for vim
sudo chown -R $USER /Library/WebServer/Documents/
cp ~/setting/vim/tern-project /Library/WebServer/Documents/.tern-project

check_file_exist /Library/WebServer/Documents/.tern-project

sudo apachectl restart
