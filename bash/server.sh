run-server () {
  case $1 in
    "--run")
      if [ -n "$2" ]; then
        sh ~/Desktop/server/$2.sh
      else
        echo "Need to give a name."
      fi
      ;;

    "--make")
      if [ -n "$2" ]; then
        cp ~/setting/template/server.sh ~/Desktop/server/$2.sh
        cd ~/Desktop/server
        vim $2.sh
      else
        echo "Need to give a name."
      fi
      ;;

    "--goto")
      cd ~/Desktop/server
      ;;
  esac
}

_runServer () {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"

  if [ ${prev} == run-server ]; then
    opts="--run --make --goto"
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
  elif [ ${prev} == --run ]; then
    opts=""
    for entry in "${HOME}/Desktop/server"/*; do
      filename=( $(basename "$entry") )
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
complete -F _runServer run-server
