cdwork () {
  cd ~/Desktop/work

  if [[ -n "$1" ]]; then
    cd $1
  fi
}

_cdWork () {
  local cur opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"

  if [ ${prev} == cdwork ]; then
    opts=""
    for entry in "${HOME}/Desktop/work"/*; do
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
complete -F _cdWork cdwork
