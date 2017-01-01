#!/bin/bash

if $CUSTOM_BASHRC > /dev/null 2>&1; then
  echo source ~/setting/bashrc >> ~/.bashrc
fi
