note () {
  case $1 in
    "--list")
      if [ -f ~/.note ]; then
        local notes=()
        while read line; do
          notes+=( "${line}" )
        done < ~/.note

        for i in "${!notes[@]}"; do
          printf "#%s %s\n" "$i" "${notes[$i]}"
        done
      fi
      ;;

    "--modify")
      if [ -f ~/.note ]; then
        if [ -n "$2" ]; then
          local notes=()
          while read line; do
            notes+=( "${line}" )
          done < ~/.note

          if [ "${#notes[@]}" == 0 ]; then
            printf "${red}✘${nocolor} notes is empty\n"
          elif [ "${notes[$2]}" == "" ]; then
            printf "${red}✘${nocolor} no such note\n"
          else
            printf "${green}✔${nocolor} ${notes[$2]}\n"

            printf "${darkGray}(modify note)${nocolor} ${symbol}"
            read context
            notes[$2]="${context}"

            printf "%s\n" "${notes[@]}" > "${HOME}/.note"
            printf "${green}✔${nocolor} ${notes[$2]}\n"
          fi
        else
          echo "Give an index of the notes"
        fi
      fi
      ;;

    "--done")
      if [ -f ~/.note ]; then
        if [ -n "$2" ]; then
          local notes=()
          while read line; do
            notes+=( "${line}" )
          done < ~/.note

          if [ "${#notes[@]}" == 0 ]; then
            printf "${red}✘${nocolor} notes is empty\n"
          elif [ "${notes[$2]}" == "" ]; then
            printf "${red}✘${nocolor} no such note\n"
          else
            printf "${green}✔${nocolor} ${notes[$2]}\n"
            unset notes[$2]
            notes=( "${notes[@]}" )
            printf "%s\n" "${notes[@]}" > "${HOME}/.note"
          fi
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

        local notes=()
        if [ -f ~/.note ]; then
          while read line; do
            notes+=( "${line}" )
          done < ~/.note
        fi
        notes+=( "${context}" )

        printf "%s\n" "${notes[@]}" > "${HOME}/.note"
        printf "${green}✔${nocolor} ${context}\n"
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
    opts="--list --modify --done --clear"
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
  fi
}
complete -F _note note
