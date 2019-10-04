
# This file is called when bash is invoked as an interactive non login shell
# and from remote logins. But it's being sourced from ~/.bash_profile to keep
# all configuration in one place


[[ -r /etc/profile ]] && source /etc/profile

read baseFolder < ~/.envFolder
completionsFolder="${baseFolder}/completions"
srcFolder="${baseFolder}/src"
localFolder="${baseFolder}/local"

for file in `/usr/bin/env ls -1 ${srcFolder}`; do
  source ${srcFolder}/${file};
done

# Start only one ssh-agent
if ! pgrep -u $USER ssh-agent > /dev/null; then
	ssh-agent >| ~/.ssh-agent-thing
fi

if [[ "$SSH_AGENT_PID" == "" ]]; then
	eval $(<~/.ssh-agent-thing)
fi

# source files after ssh agent is running and variables exported
for file in `/usr/bin/env ls -1 ${localFolder}`; do
  source ${localFolder}/${file};
done

# source completions
for file in `env ls ${completionsFolder}`; do
	source ${completionsFolder}/${file};
done

export NVM_DIR="$HOME/.config/nvm"
# load nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# load nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

localBashrc="${baseFolder}/bashrc-${HOSTNAME}"
[[ -r "${localBashrc}" ]] && source "${localBashrc}"
