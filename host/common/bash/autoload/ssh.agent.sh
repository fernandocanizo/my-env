# Find out which system is this

distro=$(lsb_release -a 2> /dev/null | grep 'Distributor ID' | awk '{print $NF}')

if [[ "$distro" = 'ManjaroLinux' || "$distro" = "Garuda" ]]; then
  if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    # start an agent if we didn't find any
    ssh-agent >| ~/.ssh-agent-thing
  fi

  if [[ "$SSH_AGENT_PID" == "" ]]; then
    # get running agent
    eval "$(<~/.ssh-agent-thing)" > /dev/null
  fi

elif [[ "$distro" = 'Ubuntu' ]]; then
  # On Ubuntu system has an already running agent, so
  # Get ssh-agent data to be able to add keys

  echo "Refactor ssh-agent code set up, current code is commented out for Ubuntu."
  # SSH_AUTH_SOCK="$(ps axu | grep ssh-agent | grep -v grep | head -n 1 | awk  '{print $NF}')"
  # export SSH_AUTH_SOCK
  # SSH_AGENT_PID=$(pgrep -u "$USER" ssh-agent)
  # export SSH_AGENT_PID
fi



