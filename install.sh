#!/bin/bash

. upgrade.sh
. git.sh
. vim.sh
. nodejs.sh
. bash.sh

## add other setting
. setting.sh

case $system in
    ($mac)
      . mac.sh
      ;;
esac

