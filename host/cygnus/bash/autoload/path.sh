#!/bin/sh
# Cygnus PATH — single source of truth for all shells and uwsm
export OMARCHY_PATH="$HOME/.local/share/omarchy"
export PATH="$OMARCHY_PATH/bin:$PATH:$HOME/.local/bin:$HOME/bin/public:$HOME/bin/private"
