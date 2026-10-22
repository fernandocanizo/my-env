# OpenCode first; 91-gentle-ai.sh then gives its launcher priority.
case ":$PATH:" in
  *":$HOME/.opencode/bin:"*) ;;
  *) export PATH="$HOME/.opencode/bin:$PATH" ;;
esac
