docker-editor() {
  case $1 in
    "--run")
      if [ -n "$2" ]; then
        sudo docker run -t -i $2 /bin/bash
      else
        echo "Need to give a name."
      fi
      ;;

    "--build")
      if [ -n "$2" ]; then
        sudo docker build -t="$2" .
      else
        echo "Need to give a name."
      fi
      ;;

    "--rm")
      sudo docker rm $(sudo docker ps -a -q)
      ;;

    "--rmi")
      sudo docker rmi $(sudo docker images | grep "^<none>" | awk "{print $3}")
      ;;
  esac
}

_dockerEditor() {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  opts="--run --build --rm --rmi"

  if [[ ${cur} == * ]] ; then
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
  fi
}
complete -F  _dockerEditor docker-editor
