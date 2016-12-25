#!/bin/bash

. command.sh

check_command git

if ! git config user.name > /dev/null 2>&1; then
  printf "[git] username: "
  read username

  git config --global user.name "$username"
fi

if ! git config user.email > /dev/null 2>&1; then
  printf "[git] email: "
  read email

  git config --global user.email $email
fi
