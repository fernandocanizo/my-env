# Ensure you put here variables that don't depend on a too customized
# installation, meaning: if you have to install a non-common application for
# this variable to be useful, then it pertains to an specific installation, not
# autoload

export EDITOR=/usr/bin/nvim
#
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/brave

export TERM=kitty

# less options, -R is to allow ANSI escape sequences
export LESS="-iCwqf -R"
export PAGER='less'
export MANPAGER="/bin/less -s"

export GREP_COLORS='auto'

# for crontab
export VISUAL=/usr/bin/nvim

if [[ -x /usr/bin/gbt ]]; then
  # got gbt, use it!
  export PS1='$(gbt $?)'
else
  if [[ $(whereis git | cut -f 2 -d':') != '' ]]; then
    # we got git
    export PS1="\[\033[01;32m\]\h:\[\033[01;36m\]\W\[\033[0;33m\]\$(current_git_branch) \[\033[0m\]\$ "
  else
    export PS1='\[\033[01;32m\]\h\[\033[01;36m\] \W \$\[\033[00m\] '
  fi
fi

# better prompt for mysql
export MYSQL_PS1="\u@\h:\d> "

# set my own LS_COLORS, can't see those blue default directories
eval "$(dircolors ~/.dircolors)"

export XDG_CONFIG_HOME="${HOME}/.config"
