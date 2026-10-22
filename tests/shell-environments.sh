#!/usr/bin/env bash
# Run from any directory: bash tests/shell-environments.sh
set -euo pipefail
root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)

# fnm owns Node, without dropping existing mise exclusions or duplicating entries.
ROOT="$root" bash --noprofile --norc <<'BASH'
set -euo pipefail
fnm() { :; }
unset MISE_DISABLE_TOOLS
source "$ROOT/host/common/bash/autoload/fnm.sh"
[[ "$MISE_DISABLE_TOOLS" == node ]]
export MISE_DISABLE_TOOLS=python,ruby
source "$ROOT/host/common/bash/autoload/fnm.sh"
[[ "$MISE_DISABLE_TOOLS" == python,ruby,node ]]
source "$ROOT/host/common/bash/autoload/fnm.sh"
[[ "$MISE_DISABLE_TOOLS" == python,ruby,node ]]
BASH

# Machines without fnm retain mise's existing configuration.
ROOT="$root" bash --noprofile --norc <<'BASH'
set -euo pipefail
command() {
  if [[ "$*" == '-v fnm' ]]; then return 1; fi
  builtin command "$@"
}
unset MISE_DISABLE_TOOLS
source "$ROOT/host/common/bash/autoload/fnm.sh"
[[ ! ${MISE_DISABLE_TOOLS+x} ]]
export MISE_DISABLE_TOOLS=python
source "$ROOT/host/common/bash/autoload/fnm.sh"
[[ "$MISE_DISABLE_TOOLS" == python ]]
BASH

# Preserve the live bashrc's app paths and Gentle AI launcher precedence.
ROOT="$root" bash --noprofile --norc <<'BASH'
set -euo pipefail
export HOME=/test-home PATH=/usr/bin
source "$ROOT/host/cygnus/bash/autoload/pnpm.sh"
[[ "$PNPM_HOME" == /home/flc/.local/share/pnpm ]]
[[ "$PATH" == /home/flc/.local/share/pnpm/bin:/usr/bin ]]
source "$ROOT/host/cygnus/bash/autoload/pnpm.sh"
[[ "$PATH" == /home/flc/.local/share/pnpm/bin:/usr/bin ]]
for file in "$ROOT"/host/cygnus/bash/autoload/9*.sh; do source "$file"; done
[[ "$PATH" == /test-home/.gentle-ai/bin:/test-home/.opencode/bin:/home/flc/.local/share/pnpm/bin:/usr/bin ]]
for file in "$ROOT"/host/cygnus/bash/autoload/9*.sh; do source "$file"; done
[[ "$PATH" == /test-home/.gentle-ai/bin:/test-home/.opencode/bin:/home/flc/.local/share/pnpm/bin:/usr/bin ]]
# An inherited PATH can already contain both launchers in the wrong order.
export PATH=/test-home/.opencode/bin:/test-home/.gentle-ai/bin:/usr/bin
for file in "$ROOT"/host/cygnus/bash/autoload/9*.sh; do source "$file"; done
[[ "$PATH" == /test-home/.gentle-ai/bin:/test-home/.opencode/bin:/usr/bin ]]
BASH
printf '%s\n' 'PASS: fnm ownership, mise fallback, pnpm reuse, and launcher precedence'
