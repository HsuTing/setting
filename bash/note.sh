note () {
  case $1 in
    "--list")
      if [ -f ~/.note ]; then
        notes=( $(cat ~/.note) )

        for i in "${!notes[@]}"; do
          printf "#%s %s\n" "$i" "${notes[$i]}"
        done
      fi
      ;;

    "--done")
      if [ -f ~/.note ]; then
        if [ -n "$2" ]; then
          notes=( $(cat ~/.note) )
          if [ "${#notes[@]}" == 0 ]; then
            printf "${red}✘${nocolor} notes is empty\n"
          elif [ "${notes[$2]}" == "" ]; then
            printf "${red}✘${nocolor} no such note\n"
          else
            printf "${green}✔${nocolor} ${notes[$2]}\n"
          fi
          unset notes[$2]
          notes=( "${notes[@]}" )
          printf "%s\n" "${notes[@]}" > "${HOME}/.note"
        else
          echo "Give an index of the notes"
        fi
      fi
      ;;

    "--clear")
      rm "${HOME}/.note"
      ;;

    *)
      if [[ ! -n "$1" ]]; then
        printf "${darkGray}(add note)${nocolor} ${symbol}"
        read context

        notes=()
        if [ -f ~/.note ]; then
          notes=( $( cat ~/.note ) )
        fi
        notes+=( "${context}" )

        printf "%s\n" "${notes[@]}" > "${HOME}/.note"
      fi
      ;;
  esac
}

_note () {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"

  if [ ${prev} == note ]; then
    opts="--list --done --clear"
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
  fi
}
complete -F _note note
