#!/bin/bash

. command.sh

check_command readline
check_command tree
check_command bash-completion

## set tern for vim
cp ./tern-project /Library/WebServer/Documents/.tern-project
