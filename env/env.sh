#!/bin/bash

set_env () {
  export $1=$2
  echo -e "Set \e[32m$1\e[39m to \e[32m$2\e[39m."
}
