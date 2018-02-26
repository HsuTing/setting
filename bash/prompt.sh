# get current branch in git repo
function parse_git_branch() {
  local branch=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`

  if [ ! "${branch}" == "" ]; then
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
    printf "${cyanBg} ${num} notes ${nocolorBg} "
  fi
}

# error
function nonzero_return() {
	local RETVAL=$?

  if [[ $RETVAL -ne 0 ]]; then
    printf "${red}(✘)${nocolor} "
  fi
}

gitBranch="${bold}\$(parse_git_branch)${normal}"
symbol="${green}➜${nocolor} "
dirPath="${cyan}\w${nocolor} "
time="${blue}[\t]${nocolor} "
user="${darkGrayBg}${bold} \u@\h ${nobold}${nocolorBg} "

export PS1="\[\$(nonzero_return)\]\[${user}\]\[${time}\]\[${dirPath}\]\[\$(get_notes)\]\[${gitBranch}\]\n\[\$(get_virtual_env)\]${symbol}"
