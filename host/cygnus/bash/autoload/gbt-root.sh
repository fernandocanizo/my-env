#!/usr/bin/env bash
# Root-specific GBT prompt styling
# Only applies when running as root

if [[ $EUID -eq 0 ]]; then
  export GBT_CAR_HOSTNAME_BG='red'
  export GBT_CAR_HOSTNAME_FG='white'
  export GBT_CAR_OS_SYMBOL_TEXT='💀'
fi
