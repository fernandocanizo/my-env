
# This file is called when bash is invoked as an interactive non login shell
# and from remote logins. But it's being sourced from ~/.bash_profile to keep
# all configuration in one place


[[ -r /etc/profile ]] && source /etc/profile

BASH_DIR="${HOME}/.bash/src/"
COMPLETIONS_DIR="${HOME}/.bash/completions"

if [[ -d $BASH_DIR ]]; then
	# first load files with no dash in their name
	# consider these files to be sourced on any host

	for FILE in `/usr/bin/env ls -1 $BASH_DIR | /usr/bin/env grep -v '-'`; do
		source ${BASH_DIR}${FILE};
	done

	# then source hostname specific files

	for FILE in `/usr/bin/env ls -1 $BASH_DIR`; do
		if [[ $(echo -n ${FILE} | grep `hostname`) ]]; then
			source ${BASH_DIR}${FILE};
		fi
	done
fi

export NVM_DIR="${HOME}/.nvm"
[ -s "${NVM_DIR}/nvm.sh" ] && . "${NVM_DIR}/nvm.sh"
[ -s "${NVM_DIR}/bash_completion" ] && . "${NVM_DIR}/bash_completion"

# add currently selected node environment to path
NODE_BIN=`which node`
export NODE_PATH=`dirname ${NODE_BIN}`

# Start only one ssh-agent
if ! pgrep -u $USER ssh-agent > /dev/null; then
	ssh-agent >| ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
	eval $(<~/.ssh-agent-thing)
fi

# Add daily used identities
ssh-add -l | cut -f3 -d' ' | grep '/home/flc/.ssh/csw_rsa' > /dev/null || ssh-add ${HOME}/.ssh/csw_rsa > /dev/null
ssh-add -l | cut -f3 -d' ' | grep bitbucket.csw_rsa > /dev/null || ssh-add ${HOME}/.ssh/bitbucket.csw_rsa > /dev/null

# source completions
for file in `env ls ${COMPLETIONS_DIR}`; do
	source ${COMPLETIONS_DIR}/${file};
done
