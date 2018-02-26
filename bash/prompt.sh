# get current branch in git repo
function parse_git_branch() {
  local branch=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`

  if [ "${branch}" != "" ]; then
    local status=`git status 2>&1 | tee`
    local isModified=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
    local isAhead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
    local isDifferent=`echo -n "${status}" 2> /dev/null | grep "different commits" &> /dev/null; echo "$?"`
    local isNewFile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
    local isUntracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
    local isDeleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`

    if [ "${isModified}" == "0" ] || [ "${isAddFile}" == "0" ] || [ "${isUntracked}" == "0" ] || [ "${isDeleted}" == "0" ]; then
      printf "${redBg} ± ${branch} ${nocolorBg}"
    elif [ "${isAhead}" == "0" ]; then
      printf "${yellowBg} ➦ ${branch} ${nocolorBg}"
    elif [ "${isDifferent}" == "0" ]; then
      printf "${yellowBg} ✘ ${branch} ${nocolorBg}"
    else
      printf "${greenBg}  ${branch} ${nocolorBg}"
    fi
  else
    printf ""
  fi
}

# get current branch tag
function get_git_tag() {
  local tag=`git describe --abbrev=0 --tags 2> /dev/null`

  if [ "$tag" != ""  ]; then
    printf "${lightGrayBg} ${tag} ${nocolor}"
  fi
}

# get Virtual Env
export VIRTUAL_ENV_DISABLE_PROMPT=1
function get_virtual_env() {
  if [[ $VIRTUAL_ENV != "" ]]; then
    local envName=`basename ${VIRTUAL_ENV}`
    printf "${darkGray}(${envName})${nocolor} "
  else
    printf ""
  fi
}

# get notes
function get_notes() {
  local notes=()
  if [ -f ~/.note ]; then
    while read line; do
      notes+=( "${line}" )
    done < ~/.note
  fi
  local num=${#notes[@]}

  if [ "${num}" == 0 ]; then
    printf ""
  else
    printf "${cyanBg} ${num} notes ${nocolorBg}"
  fi
}

# error
function nonzero_return() {
	local RETVAL=$?

  if [[ $RETVAL -ne 0 ]]; then
    printf "${red}(✘)${nocolor} "
  fi
}

# show user when user is from ssh
function get_ssh_user() {
  local user=`ps aux | grep "[s]shd: .*@.*"`

  if [ $user -z ]; then
    printf ""
  else
    printf "${yellow}⚡${darkGray}$1${nocolor} "
  fi
}

gitBranch="\$(get_git_tag)${bold}\$(parse_git_branch)${normal}"
symbol="${green}➜${nocolor} "
dirPath="${cyan}\w${nocolor} "
time="${blue}[\t]${nocolor} "

PS1=""
PS1+="\$(nonzero_return)"
PS1+="${time}"
PS1+="${dirPath}"
PS1+="\$(get_notes)"
PS1+="${gitBranch}"
PS1+="\n"
PS1+="\$(get_virtual_env)"
PS1+="\$(get_ssh_user \u@\h)"
PS1+="${symbol}"
