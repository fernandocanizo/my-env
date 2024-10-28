#!/bin/sh
# deno shell setup; adapted from rustup
# affix colons on either side of $PATH to simplify matching
case ":${PATH}:" in
    *:"/home/flc/.deno/bin":*)
        ;;
    *)
        # Prepending path in case a system-installed deno executable needs to be overridden
        export PATH="/home/flc/.deno/bin:$PATH"
        ;;
esac
