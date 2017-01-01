#!/bin/bash

. upgrade.sh
. git.sh
. nodejs.sh
. vim.sh
. bash.sh

## add other setting
. setting.sh

case $system in
    ($mac)
      . mac.sh
      ;;
esac
