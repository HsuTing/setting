#!/bin/bash

. command.sh

check_command python
check_command python3

if [ ! type "pip" > /dev/null 2>&1 ]; then
  exec_command \
  "install pip"
  "python ~/setting/python/get-pip.py"

  exec_command \
  "install virtualenv" \
  "pip install virtualenv"
fi

check_command_exist pip
check_command_exist virtualenv
