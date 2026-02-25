#!/bin/sh
case ":${PATH}:" in
    *:"/home/flc/.local/bin/spacetime":*)
        ;;
    *)
        # Prepending path in case a system-installed deno executable needs to be overridden
        export PATH="/home/flc/.local/bin/spacetime:$PATH"
        ;;
esac
