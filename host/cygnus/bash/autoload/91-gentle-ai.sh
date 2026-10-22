# Load after OpenCode so the Gentle AI launcher takes precedence.
# Move any inherited entry to the front rather than accumulating duplicates.
_gentle_ai_path=":$PATH:"
while [[ "$_gentle_ai_path" == *":$HOME/.gentle-ai/bin:"* ]]; do
  _gentle_ai_path=${_gentle_ai_path/":$HOME/.gentle-ai/bin:"/:}
done
_gentle_ai_path=${_gentle_ai_path#:}
_gentle_ai_path=${_gentle_ai_path%:}
export PATH="$HOME/.gentle-ai/bin:$_gentle_ai_path"
unset _gentle_ai_path
