# Set color
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad

# Highlight matches
export GREP_OPTIONS='--color=auto'

# bash style
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1 /'
}
export PS1="\u@\h:\[\e[0;104m\]\$(parse_git_branch)\[\e[m\] \[\e[m\]\[\e[0;91m\][\d  \t]\[\e[m\] \[\e[0;96m\]\w\[\e[m\] \n>> "

# add other bashrc
. ~/setting/setting.sh

cdlocal () {
  case $system in
    ($linux)
      cd /var/www/html
      ;;

    ($mac)
      cd /Library/WebServer/Documents
      ;;
  esac
}
setting () {
  case $1 in
    "install"|"-i")
      cd ~/setting && ./install.sh
      ;;

    "update"|"-u")
      cd ~/setting && git pull origin master
      ;;

    *)
      cd ~/setting
      ;;
  esac
}
alias cdwork='cd ~/Desktop/work'

## docker
dockerRun() {
  sudo docker run -t -i $1 /bin/bash
}
dockerBuild() {
  sudo docker build -t="$1" .
}
dockerImages() {
  sudo docker images
}
dockerContainers() {
  sudo docker ps -a
}
dockerRm() {
  sudo docker rm $(sudo docker ps -a -q)
}
dockerRmi() {
  sudo docker rmi $(sudo docker images | grep "^<none>" | awk "{print $3}")
}

# other
case $system in
  ($mac)
    # tab autocomplete
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
    fi
    ;;
esac
