#!/bin/bash

. command.sh

check_command git
check_command vim

if [ ! -e ~/.vim/bundle/Vundle.vim ]; then
  print_command \
  "add '.vimrc' and vim plugin"

  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  ln vimrc ~/.vimrc
  vim +PluginInstall +qall
  cp -R ~/.vim/bundle/vim-colorschemes/colors/ ~/.vim
fi
