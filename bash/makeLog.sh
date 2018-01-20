. ~/setting/setting.sh

alias _makeLog="conventional-changelog -p angular -i CHANGELOG.md -s -r 0"
make-log() {
  if [ ! -z "$1" ]; then
    git tag $1 && \
    _makeLog && \
    git add CHANGELOG.md && \
    git commit --amend  --no-edit && \
    git tag -d $1 && \
    git tag -a $1 && \
    _makeLog
  else
    printf "${red}(✘)${nocolor} You need to give a tag\n"
  fi
}
