# Find out which system is this

distro=$(lsb_release -a 2> /dev/null | grep 'Distributor ID' | awk '{print $NF}')

if [[ ${distro} = 'ManjaroLinux' ]]; then
  if ! pgrep -u $USER ssh-agent > /dev/null; then
    # start an agent if we didn't find any
    ssh-agent >| ~/.ssh-agent-thing
  fi

  if [[ "$SSH_AGENT_PID" == "" ]]; then
    # get running agent
    eval $(<~/.ssh-agent-thing) > /dev/null
  fi

elif [[ ${distro} = 'Ubuntu' ]]; then
  # On Ubuntu system has an already running agent, so
  # Get ssh-agent data to be able to add keys
  export SSH_AUTH_SOCK=$(ps axu | grep ssh-agent | grep -v grep | head -n 1 | awk  '{print $NF}')
  export SSH_AGENT_PID=$(pgrep -u $USER ssh-agent)
fi



