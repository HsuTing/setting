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
        cp ~/setting/template/env.sh ~/Desktop/env/$2.sh
        cd ~/Desktop/env
        vim $2.sh
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

  if [ ${prev} == run-env ]; then
    opts="--run --make --goto"
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
  elif [ ${prev} == --run ]; then
    opts=""
    for entry in "${HOME}/Desktop/env"/*; do
      filename=$(basename "$entry")
      filename="${filename%.*}"
      if [ $filename == key ]; then
        continue
      fi
      opts+=" $filename"
    done
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
  fi
}
complete -F _runEnv run-env
