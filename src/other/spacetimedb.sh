#!/bin/sh
case ":${PATH}:" in
    *:"/home/flc/.local/bin":*)
        ;;
    *)
        # Prepending path in case a system-installed deno executable needs to be overridden
        export PATH="/home/flc/.local/bin:$PATH"
        ;;
esac
