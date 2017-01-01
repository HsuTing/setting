#!/bin/bash

. setting.sh
. command.sh

check_command git
check_command vim
check_command cmake

case $system in
  ($linux)
    check_command python-dev
    ;;
esac

if [ ! -e ~/.vim/bundle/Vundle.vim ]; then
  print_command \
  "add '.vimrc' and vim plugins"

  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  ln vimrc ~/.vimrc
  vim +PluginInstall +qall

  ## run other setting of vim plugins
  cp -R ~/.vim/bundle/vim-colorschemes/colors/ ~/.vim
  ~/.vim/bundle/YouCompleteMe/install.py --tern-completer
fi
