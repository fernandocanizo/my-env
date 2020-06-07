# This file is called when bash is invoked as an interactive non login
# shell and from remote logins. But it's being sourced from
# ~/.bash_profile to keep all configuration in one place
[[ -r /etc/profile ]] && source /etc/profile


# Start ssh-agent, only one
if ! pgrep -u $USER ssh-agent > /dev/null; then
	ssh-agent >| ~/.ssh-agent-thing
fi

if [[ "$SSH_AGENT_PID" == "" ]]; then
	eval $(<~/.ssh-agent-thing)
fi

# ~/.envFolder is generated on installation
read baseFolder < ~/.envFolder

srcFolder="${baseFolder}/src/common"
localFolder="${baseFolder}/src/$HOSTNAME"
# ensure local folder exists on new machines
test -d ${localFolder} || mkdir -p ${localFolder}
completionsFolder="${baseFolder}/completions"

# load all that's common to any shell, any machine
for file in `/usr/bin/env ls -1 ${srcFolder}`; do
  source ${srcFolder}/${file};
done

# after ssh agent is running and variables exported...
# source local configurations
for file in `/usr/bin/env ls -1 ${localFolder}`; do
  source ${localFolder}/${file};
done

# source completions
# global
[[ $BASH_COMPLETION = '' ]]\
  && [[ -r /etc/bash_completion ]]\
  && source /etc/bash_completion

# local
for file in `env ls ${completionsFolder}`; do
	source ${completionsFolder}/${file};
done

