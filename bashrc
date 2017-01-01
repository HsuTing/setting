export CUSTOM_BASHRC=1

# Set color
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad

# Highlight matches
export GREP_OPTIONS='--color=auto'

# bash style
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1 /'
}

# path to
export PS1="\u@\h:\[\e[0;104m\]\$(parse_git_branch)\[\e[m\] \[\e[m\]\[\e[0;91m\][\d  \t]\[\e[m\] \[\e[0;96m\]\w\[\e[m\] \n>> "

# add other bashrc
. setting.sh

case $system in
  ($mac)
    # tab autocomplete
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
    fi
    ;;
esac
