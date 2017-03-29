run-env () {
  case $1 in
    "--run")
      if [ -n "$2" ]; then
        source ~/Desktop/env/$2.sh
      else
        echo "Need to give a name."
      fi
      ;;

    "--make")
      if [ -n "$2" ]; then
        cp ~/setting/env/template-env.sh ~/Desktop/env/$2.sh
        cd ~/Desktop/env
      else
        echo "Need to give a name."
      fi
      ;;

    "--goto")
      cd ~/Desktop/env
      ;;
  esac
}

_runEnv () {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  opts="--run --make --goto"

  if [[ ${cur} == * ]] ; then
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
  fi
}
complete -F _runEnv run-env
