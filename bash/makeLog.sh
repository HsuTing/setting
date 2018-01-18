. ~/setting/setting.sh

make-log() {
  if [ ! -z "$1" ]; then
    git tag $1
    conventional-changelog -p angular -i CHANGELOG.md -s -r 0
    git add .
    git commit -m "make CHANGELOG.md"
    git rebase -i HEAD~2
    git tag -d $1
    git tag -a $1
    conventional-changelog -p angular -i CHANGELOG.md -s -r 0
  else
    printf "${red}(✘)${nocolor} You need to give a tag\n"
  fi
}
