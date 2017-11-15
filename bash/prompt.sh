# get current branch in git repo
function parse_git_branch() {
  branch=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`

  if [ ! "${branch}" == "" ]; then
    status=`git status 2>&1 | tee`
    isModified=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
    isAhead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
    isDifferent=`echo -n "${status}" 2> /dev/null | grep "different commits" &> /dev/null; echo "$?"`

    if [ "${isModified}" == "0" ]; then
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
function get_virtual_env() {
  if [[ $VIRTUAL_ENV != "" ]]; then
    envName=`basename ${VIRTUAL_ENV}`
    printf "${darkGray}(${envName})${nocolor} "
  else
    printf ""
  fi
}

# error
export VIRTUAL_ENV_DISABLE_PROMPT=1
function nonzero_return() {
	RETVAL=$?

  if [[ $RETVAL -ne 0 ]]; then
    printf "${red}(✘)${nocolor} "
  fi
}

gitBranch="${bold}\$(parse_git_branch)${normal}"
symbol="${green}➜${nocolor} "
dirPath="${cyan}\w${nocolor} "
time="${blue}[\t]${nocolor} "

export PS1="\[\$(nonzero_return)\]\[${time}\]\[${dirPath}${gitBranch}\]\n\[\$(get_virtual_env)\]${symbol}"
