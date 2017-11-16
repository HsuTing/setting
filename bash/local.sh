. ~/setting/setting.sh

localPath="/var/www/html"

if [ ${system} == ${mac} ]; then
  localPath="/Library/WebServer/Documents"
fi

cdlocal () {
  cd ${localPath}

  if [[ -n "$1" ]]; then
    cd $1
  fi
}

_cdLocal () {
  local cur opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"

  if [ ${prev} == cdlocal ]; then
    opts=""
    for entry in "${localPath}"/*; do
      filename=( $(basename "$entry") )
      filename="${filename%.*}"
      opts+=" $filename"
    done
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
  fi
}
complete -F _cdLocal cdlocal
