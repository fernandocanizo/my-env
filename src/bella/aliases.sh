#------------------------------------------------------------------------------
# fun with alias
#------------------------------------------------------------------------------

#
# convenience aliases
#

alias x='/usr/bin/startx; wait; rm -f ~/.serverauth.*'
alias xtris='/usr/bin/xtris -n $LOGNAME'

#
# functional aliases
#

alias perl-rename='perl-rename -i'

# let me on current pwd after exiting mc
alias mc='. /usr/lib/mc/mc-wrapper.sh'

# default dictionary to look up for words: wordnet
alias dict='PAGER=cat dict -d wn'
alias wikipedia-en="dict -h dict.aioe.org -d Wikipedia_EN"
alias wikipedia-es="dict -h dict.aioe.org -d Wikipedia_ES"

alias irc='screen -S irc weechat'

#
# old common commands replaced by improved versions
#
alias info="pinfo"
alias diff="colordiff"
alias top="htop"

# check image size
alias imgsize='exiftool -ImageWidth -ImageHeight '

alias mozilla='/usr/bin/firefox'

#  change filename encoding to utf8 from iso8859-1
alias filename2utf8='convmv --notest -f iso88591 -t utf8'

# pretty printing for mount (but you can use it with anything that gives screwed input)
alias mount='mount | column -t'

# control keys for mpg123
alias mpg123='mpg123 -C'

# so I can run nm-applet with sudo powers from i3 menu
alias nm-applet='sudo nm-applet'

# automatically name downloaded videos from Youtube
alias youtube-dl='youtube-dl --ignore-errors --continue --no-overwrites --restrict-filenames --format mp4 --output "%(title)s-%(id)s.%(ext)s"'

alias reboot="sudo systemctl reboot"
alias halt="sudo systemctl poweroff"

# secondary X selection cannot be copied with shift+insert, so I have this alias which uses xclip to print it out
alias xclipboard='xclip -o -selection clipboard && echo'

# clone a git repository after having clicked the "Copy to clibboard" button
alias clipclone='git clone `xclipboard`'

# c programming
alias compile='gcc -g -Wall -ansi -pedantic -std=c99'

# use ES6 in node.js
alias node='node --harmony'

alias pingendo='/opt/pingendo/Pingendo'

# 2015.06.01
# Use angular-seed project to bootstrap applications
alias angular-seed='git clone https://github.com/angular/angular-seed.git '

# 2016.06.27
alias node.electron='mancy'

# 2016.09.21
alias ifconfig='ip addr show'

# 2017.03.07
alias grive='grive -p /home/flc/gdrive/'

# 2017.06.20
alias oe='open-editor'

# 2017.12.20
alias dockstation='/opt/DockStation/dockstation'

# 2018.12.12 to mount toshiba 1tb portable disk in the proper place for other things to work
alias mine='pmount /dev/sdb1 mine'
alias umine='pumount /media/mine'

# 2018.12.14 activate python virtual environment
alias activate='source ~/myPython3/bin/activate'

# 2019.05.01
alias lexar='mount | grep -q lexar || pmount /dev/mmcblk0p1 lexar'
alias ulexar='pumount /media/lexar'
# always mount lexar memory before starting dropbox
alias dropbox='lexar; wait; dropbox &'

# evitar cargar GBT, que me rompe el acceso al NAS
alias nas='urxvt -e env -i bash --norc --noprofile'

# para no tener que poner todos los parámetros cuando quiero usar psql
# para extraer datos nomás
alias psql-data='psql -t --no-psqlrc '

alias pg.dump.help="pg_dump --help | grep -E --color '(\-\-file|\-\-clean|\-\-no\-owner|\-\-no\-privileges)'"

alias find.nas='nmap -sn 192.168.100.* | grep nas'

# human readable output, human readable timestamps and constant output for dmesg
alias dmesg='sudo dmesg -HTw '
