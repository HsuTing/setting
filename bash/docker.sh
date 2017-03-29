docker-editor() {
  case $1 in
    "--run")
      if [ -n "$2" ]; then
        docker run -t -i $2 /bin/bash
      else
        echo "Need to give a name."
      fi
      ;;

    "--build")
      if [ -n "$2" ]; then
        docker build -t="$2" .
      else
        echo "Need to give a name."
      fi
      ;;

    "--rm")
      docker rm $(docker ps -a -q)
      ;;

    "--rmi")
      docker rmi $(docker images | grep "^<none>" | awk "{print $3}")
      ;;
  esac
}

_dockerEditor() {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"

  if [ ${prev} == docker-editor ]; then
    opts="--run --build --rm --rmi"
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
  elif [ ${prev} == --run ] && [ ${prev} == --build ]; then
    opts=""
    for entry in "${PWD}"/*; do
      filename=$(basename "$entry")
      filename="${filename%.*}"
      opts+=" $filename"
    done
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
  fi
}
complete -F  _dockerEditor docker-editor
