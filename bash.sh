#!/bin/bash

. command.sh

if $CUSTOM_BASHRC > /dev/null 2>&1; then
  print_command \
  "add custom '.bashrc'"

  echo source ~/setting/bashrc >> ~/.bashrc
fi
