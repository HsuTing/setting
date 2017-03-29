#!/bin/bash

. upgrade.sh
. git.sh
. nodejs.sh
. vim.sh
. bash.sh
. python.sh
. postgresql.sh

## add other setting
. setting.sh

case $system in
  ($linux)
    . linux.sh
    ;;

  ($mac)
    . mac.sh
    ;;
esac
