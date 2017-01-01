#!/bin/bash

. command.sh

if ! type "brew" > /dev/null 2>&1; then
  print_command \
  "add other plugins"

  check_command readline
  check_command tree
  check_command bash-completion
fi
