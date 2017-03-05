_run_env () {
  case $1 in
    "--run"|"-r")
      if [ -n "$2" ]; then
        source ~/Desktop/env/$2.sh
      fi
      ;;

    "--make"|"-m")
      if [ -n "$2" ]; then
        cp ~/setting/env/template-env.sh ~/Desktop/env/$2.sh
        cd ~/Desktop/env
      fi
      ;;

    "--goto"|*)
      cd ~/Desktop/env
      ;;
  esac
}
alias run-env="_run_env"

_runEnv () {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  opts="-r -m --run --make --goto"

  if [[ ${cur} == * ]] ; then
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
  fi
}
complete -F _runEnv run-env
