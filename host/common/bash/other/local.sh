#!/bin/sh

# Add all local folders that contain binaries

SYSTEM_LOCAL_BIN="$HOME/.local/bin/"
MY_PUBLIC_BIN="$HOME/bin/public"
MY_PRIVATE_BIN="$HOME/bin/private"

export PATH="$SYSTEM_LOCAL_BIN:$MY_PRIVATE_BIN:$MY_PUBLIC_BIN:$PATH"
