#!/usr/bin/env bash

if [[ "$TERM" == "xterm-kitty" ]]; then
  alias ff="fzf --preview 'case \$(file --mime-type -b {}) in image/*) kitty icat --clear --transfer-mode=memory --stdin=no --place=\${FZF_PREVIEW_COLUMNS}x\${FZF_PREVIEW_LINES}@0x0 {} ;; *) bat --style=numbers --color=always {} ;; esac'"
else
  alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
fi

if command -v zoxide &> /dev/null; then
  alias cd="zd"
  zd() {
    if (( $# == 0 )); then
      builtin cd ~ || return
    elif [[ -d $1 ]]; then
      builtin cd "$1" || return
    else
      if ! z "$@"; then
        echo "Error: Directory not found"
        return 1
      fi

      printf "\U000F17A9 "
      pwd
    fi
  }
fi

open() (
  xdg-open "$@" >/dev/null 2>&1 &
)

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
# --- eza / ls ---
alias eza='eza -alh --color=always --group-directories-first --icons=auto'

export LS_OPTIONS='--color=always --file-type --group-directories-first --time-style=long-iso -c --human-readable -l'

# 99.99% of the time ls, use \ls or /bin/ls for standard ls
alias ls='ls $LS_OPTIONS '

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


# --- bat / cat ---
alias cat='bat --style header --style snip --style changes --style header'

# --- grep ---
alias egrep='ugrep -E --color=auto'
alias fgrep='ugrep -F --color=auto'
alias grep='ugrep --color=auto'

# --- nvim ---
alias vi='nvim'
alias vim='nvim'

# --- pacman / system ---
alias biggestPkgs="expac -H M '%m\t%n' | sort -h | nl"
alias cleanPacman='sudo pacman -Rns $(pacman -Qtdq)'
alias removePacmanLock="sudo rm /var/lib/pacman/db.lck"
alias gitPkgs='pacman -Q | grep -i "\-git" | wc -l'
alias grubup="sudo update-grub"
alias hw='hwinfo --short'
alias ip='ip -color'
alias jctl="journalctl -p 3 -xb"
alias mirror="sudo reflector --fastest 30 --latest 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias rmpkg="sudo pacman -Rdd"
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

# --- processes ---
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

# --- conditional ---
[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'

# which process is eating my cpu?
alias cpueaters='ps ax -o pcpu,pid,cmd | sort -nr | head -n 10'

alias dmesg="sudo dmesg -T | sed -e 's|\(^.*'`date +%Y`']\)\(.*\)|\x1b[0;34m\1\x1b[0m - \2|g'"

alias mem="ps -e -orss=,pid=,args= | sort -b -k1n | pr -TW$COLUMNS"

alias cal='cal -3wm'
alias caly='\cal -wmy'

alias pretend='cat /dev/urandom | hexdump | grep --color=auto cafe'

# 2017.06.03 para las pelis que tienen bajo volumen
alias mplayerBigVolume='mplayer -cache 8192 -softvol -softvol-max 200 '

# 2017.07.20 edit last taken screenshot
alias edit-last-screenshot='gimp ~/screenshots/`sl -tr ~/screenshots | tail -n 1`'

alias feh='feh --draw-filename --fullscreen --hide-pointer --sort "filename" '

alias tb='nc termbin.com 9999'

# 2018.12.11 always activate mpg123 play controls
alias mpg='mpg123 -C --buffer 10240 *.mp3'

# markdown viewer
alias md='glow -p'

