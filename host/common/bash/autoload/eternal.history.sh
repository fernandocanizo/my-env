#!/bin/bash

# Note 2023-08-20: for some unknown reason Bash sometimes would save several
# commands after a single timestamp. The correct way is one timestamp per
# command. But since it has this erratic behaviour, sometimes, when I cycle
# through the history upwards via up-arrow key, I get to one of these compound
# commands, and my screen has to be reset. Also if by error I press ENTER, all
# the commands get run, which is dangerous. Also since so many things run, I
# always end up killing the terminal when one of the commands allows me to
# pause.
#
# So I'm disabling the feature to save timestamps.
# export HISTTIMEFORMAT='%d/%m/%y %T '
unset HISTTIMEFORMAT

# ignorespace: lines beginning with a space are not saved to history
# ignoredups: don't save repeated commands (but just check previous one)
export HISTCONTROL='ignorespace:ignoredups'

# don't limit the amount of commands saved, save them all
export HISTSIZE=-1

# don't truncate my history, I want it all
export HISTFILESIZE=-1

export HISTFILE=~/.bash_eternal_history

# Note 2017.05.26: sometimes I want to repeat a 2-character command by using arrow
# keys, and I always end up issuing another unwanted command, so I decided to
# stop using HISTIGNORE
# Don't save trivial 1- and 2-letter commands.
#HISTIGNORE=?:??

# Bash saves the command history it's holding in memory upon shell exit, setting
# up PROMPT_COMMAND allows me to configure a command to be executed upon each
# command run, so I'm configuring it to issue an 'history -a', that appends
# immediately current history to history file, protecting against terminal crashes.
# Write history on each command, not on shell exit
export PROMPT_COMMAND='history -a'
