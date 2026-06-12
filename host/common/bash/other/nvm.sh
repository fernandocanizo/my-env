# Avoid message:
# "nvm is not compatible with the npm config "prefix" option"
npm config delete prefix

export NVM_DIR="$HOME/.config/nvm"
# load nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# load nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
