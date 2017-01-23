#!/bin/bash

. command.sh

check_command apache2
check_command tree
sudo chown -R $USER /var/www/html

## set tern for vim
cp ./tern-project /var/www/html/.tern-project
