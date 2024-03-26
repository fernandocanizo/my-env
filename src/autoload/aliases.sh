#------------------------------------------------------------------------------
# fun with alias
#------------------------------------------------------------------------------

#
# convenience aliases
#

# use perl regexp on grep
alias grep='grep -E'

# less: ignore case unless search includes uppercase characters
alias l='/usr/bin/env less -i'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -ia'
alias m='mount'
alias u='umount'
alias du='du -h'

# sorted output for du
alias dusorted='for i in G M K; do du -hsx * | grep -E "[0-9]$i\b" | sort -nr; done 2>/dev/null'
alias ducks='du -cks * 2>/dev/null | sort -rn | head -n 10'
alias df='df -h'
alias h='history'
alias j="jobs -l"
alias head='head -n 30'
alias tail='tail -n 30'
alias utgz='tar zxvf'
alias tgz='tar zcvf'


# functional aliases

alias findpath="find `echo $PATH | tr :. ' ''' ` -iname "
alias psl='/bin/ps -aufx | /bin/less -i'

alias rmtmp='echo Deleting all temporal files...

	echo rm -f \#* *~ .*~ *.bak .*.bak  *.tmp .*.tmp core a.out;
	rm -f \#* *~ .*~ *.bak .*.bak  *.tmp .*.tmp core a.out;
	echo "Done.";'

alias date.='date +%Y.%m.%d'
alias date-='date +%Y-%m-%d'
alias datehour='date +%Y.%m.%d-%H.%M.%S'
alias hour='date +%H.%M.%S'
alias seconds='date +%s'

#
# fun with ls
#

export LS_OPTIONS='--color=always --file-type --group-directories-first --time-style=long-iso -c'

# 99.99% of the time ls, use \ls or /bin/ls for standard ls
alias ls='ls $LS_OPTIONS  -l'
alias lh='ls -h'

# sl = Short Ls
alias sl='\ls -1'
alias sla='\ls -1a'

# show hidden files
alias la='ls -A $LS_OPTIONS'

# sorted by modification time
alias ltr='/bin/ls -ltr --color=auto'

# comma separated values
alias lcsv='/bin/ls -m'

# list directory, not its contents
alias lsd='ls -d'

# quote name
alias slq='\ls -1 --quote-name'

# don't show shell pattern provided
alias nls='\ls --ignore='

# show only directories
alias dir='\ls -l --color=always | grep -E "^d"'

# not ls, but for ls-ing: see octal permissions on files
alias lsmode='find . -printf "%m %p n\n"'

# which process is eating my cpu?
alias cpueaters='ps ax -o pcpu,pid,cmd | sort -nr | head -n 10'

alias dmesg="dmesg -T | sed -e 's|\(^.*'`date +%Y`']\)\(.*\)|\x1b[0;34m\1\x1b[0m - \2|g'"

alias mem="ps -e -orss=,pid=,args= | sort -b -k1n | pr -TW$COLUMNS"

alias cal='cal -3wm'
alias caly='\cal -wmy'

alias pretend='cat /dev/urandom | hexdump | grep --color=auto cafe'
alias cafe=pretend

# 2017.06.03 para las pelis que tienen bajo volumen
alias mplayer='mplayer -cache 8192 -softvol -softvol-max 200 '

# 2017.07.20 edit last taken screenshot
alias edit-last-screenshot='gimp ~/screenshots/`sl -tr ~/screenshots | tail -n 1`'

alias feh='feh --draw-filename --fullscreen --hide-pointer --sort "filename" '

alias tb='nc termbin.com 9999'

# 2018.12.11 always activate mpg123 play controls
alias mpg='mpg123 -C --buffer 10240 *.mp3'

# 2019.05.09
# now that I have two notebooks again I should start caring about when do
# this aliases run, this one should be in both machines, but not here, on
# general aliases since this doesn't belong to a server machine
# So I need to devise a new way to load stuff
# Also the loading based on hostname doesn't do when I want to
# differentiate from work aliases and non-work aliases
alias qbittorrent="mount | grep -q 'media/mine' && qbittorrent || echo 'Cannot start qbittorrent without /media/mine mounted!'"

