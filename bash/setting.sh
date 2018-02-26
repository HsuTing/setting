setting () {
  case $1 in
    "--install")
      local root=`pwd`
      cd ~/setting && ./install.sh
      cd $root
      ;;

    "--update")
      local root=`pwd`
      cd ~/setting && git pull origin master
      cd $root
      ;;

    "--goto")
      cd ~/setting
      ;;

    *)
      cd ~/setting
      ;;
  esac
}


_setting () {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"

  if [ ${prev} == setting ]; then
    opts="--install --update --goto"
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
  fi
}
complete -F _setting setting
