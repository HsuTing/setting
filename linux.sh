#!/bin/bash

. command.sh

check_command apache2
check_command tree
install_command chown -R $USER /var/www/html

## set tern for vim
cp ~/setting/vim/tern-project /var/www/html/.tern-project
