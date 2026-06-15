#!/usr/bin/env bash
# Consolidated aliases from Cygnus dotfiles + Omarchy
# TODO: review and deduplicate with host/common/bash/autoload/aliases.sh

# --- eza / ls ---
alias la='eza -a --color=always --group-directories-first --icons'
alias ll='eza -l --color=always --group-directories-first --icons'
alias ls='eza -lh --group-directories-first --icons=auto'
alias l.='eza -ald --color=always --group-directories-first --icons .*'
alias lsa='ls -a'
alias lt='eza -aT --color=always --group-directories-first --icons'
alias ltt='eza --tree --level=2 --long --icons --git'
alias ltta='ltt -a'

# --- bat / cat ---
alias cat='bat --style header --style snip --style changes --style header'

# --- grep ---
alias egrep='ugrep -E --color=auto'
alias fgrep='ugrep -F --color=auto'
alias grep='ugrep --color=auto'

# --- git ---
alias g='git'
alias gcad='git commit -a --amend'
alias gcam='git commit -a -m'
alias gcm='git commit -m'

# --- nvim ---
alias n='nvim'
alias vi='nvim'
alias vim='nvim'

# --- pacman / system ---
alias biggestPkgs="expac -H M '%m\t%n' | sort -h | nl"
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias gitPkgs='pacman -Q | grep -i "\-git" | wc -l'
alias grubup="sudo update-grub"
alias hw='hwinfo --short'
alias ip='ip -color'
alias jctl="journalctl -p 3 -xb"
alias mirror="sudo reflector --fastest 30 --latest 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias rmpkg="sudo pacman -Rdd"
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias upd='/usr/bin/garuda-update'

# --- processes ---
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

# --- tar / wget ---
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '

# --- tools (Omarchy) ---
alias c='opencode'
alias cx='printf "\033[2J\033[3J\033[H" && claude --permission-mode bypassPermissions'
alias d='docker'
alias eff='$EDITOR "$(ff)"'
alias ic='tdl c'
alias icx='tdl c cx'
alias ix='tdl cx'
alias r='rails'
alias t='tmux attach || tmux new -s Work'

# --- misc ---
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

# --- conditional ---
[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'
