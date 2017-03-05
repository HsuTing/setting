#!/bin/bash

. setting.sh
. command.sh

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
  ln ~/setting/vim/vimrc ~/.vimrc
  vim +PluginInstall +qall

  ## run other setting of vim plugins
  ## color
  cp -R ~/.vim/bundle/vim-colorschemes/colors/ ~/.vim/colors

  ## YCM
  cp ~/setting/vim/tern-project ~/.tern-project
  ~/.vim/bundle/YouCompleteMe/install.py --tern-completer

  ## fonts
  git clone https://github.com/powerline/fonts.git
  . ~/setting/fonts/install.sh
fi
