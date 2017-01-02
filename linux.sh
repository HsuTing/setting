#!/bin/bash

. command.sh

check_command apache2
sudo chown -R $USER /var/www/html
