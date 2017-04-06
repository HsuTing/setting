#!/bin/bash

. ~/setting/setting.sh
. ~/setting/command.sh

check_command vim
check_command cmake

case $system in
  ($linux)
    check_command python-dev
    ;;
esac

if [ ! -e ~/.vim/bundle/Vundle.vim ]; then
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

check_folder_exist ~/.vim/bundle/Vundle.vim
check_folder_exist ~/.vim/colors
check_folder_exist ~/.tern-project
check_folder_exist ~/setting/fonts
