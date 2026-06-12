# correct spelling on cd commands
shopt -s cdspell

# save multiline commands to the same register
shopt -s cmdhist

# append to ~/.bash_history instead of overwriting
shopt -s histappend

# try to complete host when a @ is seen
shopt -s hostcomplete

# embed newlines from multiline commands instead of colon
shopt -s lithist

# don't attempt to complete on empty lines
shopt -s no_empty_cmd_completion

# do not delete existing files with >, use >| to force an overwrite
set -o noclobber

# don't create core dumps
ulimit -c 0

# all public by default
umask 0022

# direct auto-complete in bash
# I don't like this, but I keep trying it after a while because I forget about it
# So keep this comment to avoid using it again
#bind '"\t":menu-complete'

# tries to correct minor dir spellings
shopt -s dirspell
