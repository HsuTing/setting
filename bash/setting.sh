setting () {
  case $1 in
    "--install")
      cd ~/setting && ./install.sh
      ;;

    "--update")
      cd ~/setting && git pull origin master
      ;;

    "--goto")
      cd ~/setting
      ;;
  esac
}


_setting () {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  opts="--install --update --goto"

  if [ ${cur} == * ]; then
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
  fi
}
complete -F _setting setting
