. ~/setting/setting.sh

drawing-info() {
  printf "\n${cyan}# $1\n"
  printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
  printf "${nocolor}"
}

cat-check() {
  drawing-info "node security check"
  nsp check "$(pwd)/package.json"

  if [ -f $(pwd)/.npmignore ]; then
    drawing-info "npm ignore check"
    cat-bin npmignore
  fi

  drawing-info "npm package check"
  cat-bin check
}
