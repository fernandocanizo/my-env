
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

# add currently selected node environment to path
#NODE_BIN=`which node`
#export NODE_PATH=`dirname ${NODE_BIN}`:$(dirname $(dirname $NODE_BIN))/lib/node_modules

# Start only one ssh-agent
if ! pgrep -u $USER ssh-agent > /dev/null; then
	ssh-agent >| ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
	eval $(<~/.ssh-agent-thing)
fi

# Add daily used identities
ssh-add -l | cut -f3 -d' ' | grep '/home/flc/.ssh/csw_rsa' > /dev/null || ssh-add ${HOME}/.ssh/csw_rsa > /dev/null
ssh-add -l | cut -f3 -d' ' | grep geoportal > /dev/null || ssh-add ${HOME}/.ssh/geoportal > /dev/null
ssh-add -l | cut -f3 -d' ' | grep bitbucket.csw_rsa > /dev/null || ssh-add ${HOME}/.ssh/bitbucket.csw_rsa > /dev/null
ssh-add -l | cut -f3 -d' ' | grep github_bella > /dev/null || ssh-add ${HOME}/.ssh/github_bella > /dev/null

# source completions
for file in `env ls ${COMPLETIONS_DIR}`; do
	source ${COMPLETIONS_DIR}/${file};
done

# Nativescript completion 
###-tns-completion-start-###
#if [ -f /home/flc/.tnsrc ]; then 
#    source /home/flc/.tnsrc 
#fi
###-tns-completion-end-###


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /home/flc/.nvm/versions/node/v8.11.1/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /home/flc/.nvm/versions/node/v8.11.1/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /home/flc/.nvm/versions/node/v8.11.1/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /home/flc/.nvm/versions/node/v8.11.1/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash