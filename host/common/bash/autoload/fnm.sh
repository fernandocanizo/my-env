# Reserve Node for fnm; mise remains available for other runtimes.
# This must run before mise activation, including its directory/prompt hooks.
if command -v fnm >/dev/null 2>&1; then
  case ",${MISE_DISABLE_TOOLS-}," in
    *,node,*) ;;
    *) export MISE_DISABLE_TOOLS="${MISE_DISABLE_TOOLS:+$MISE_DISABLE_TOOLS,}node" ;;
  esac
fi
