aliases |= {
  'vi': 'nvim',
  'vim': 'nvim',
  'dst': 'dropbox-cli status',

  # `pass` aliases since I'll be editing many, many files...
  'pim': 'pass insert -m ',
  'pe': 'pass edit ',
  'pgp': 'pass git push',

  # less: ignore case unless search includes uppercase characters
  'l': '/usr/bin/env less -i',
  'rm': 'rm -i',
  'mv': 'mv -i',
  'cp': 'cp -ia',
  'm': 'mount',
  'u': 'umount',

  # fun with du
  'du': 'du -h',
  'dusorted': 'for i in G M K; do du -hsx * | grep -E "[0-9]$i\b" | sort -nr; done 2>/dev/null',
  'ducks': 'du -cks * 2>/dev/null | sort -rn | head -n 10',

  'df': 'df -h',
  'h': 'history',
  'j': 'jobs -l',
  'head': 'head -n 30',
  'tail': 'tail -n 30',
  'utgz': 'tar zxvf',
  'tgz': 'tar zcvf',

  # functional aliases
  'psl': '/bin/ps -aufx | /bin/less -i',

  # fun with dates
  'date.': 'date +%Y.%m.%d',
  'date-': 'date +%Y-%m-%d',
  'datehour': 'date +%Y.%m.%d-%H.%M.%S',
  'hour': 'date +%H.%M.%S',
  'seconds': 'date +%s',

  # fun with ls
  # 99.99% of the time ls, use \ls or /bin/ls for standard ls
  'ls': 'ls --color=always --file-type --group-directories-first --time-style=long-iso -c -l',
  'lh': 'ls -h',
  # sl = short ls (escape previous aliases via env)
  'sl': '/usr/bin/env ls -1',
  'sla': '/usr/bin/env ls -1a',
  # show hidden files
  'la': 'ls -A',
  # sort by modification time
  'ltr': '/usr/bin/env ls -ltr --color=auto',
  # as comma separated values
  'lcsv': '/usr/bin/env ls -m',
  # list directory, not its contents
  'lsd': 'ls -d',
  # quote name
  'slq': '/usr/bin/env ls -1 --quote-name',
  # don't show shell pattern provided
  'nls': '/usr/bin/env ls --ignore=',
  # show only directories
  'folders': '/usr/bin/env ls -l --color=always | grep -E "^d"',

  # not ls, but for ls-ing: see octal permissions on files
  'lsmode': r'find . -printf "%m %p\n"',

  # always use `grep -E`, which provides perl regexps, the "egrep" alias is
  # deprecated
  'grep': 'grep -E',

  # which process is eating my cpu?
  'cpueaters': 'ps ax -o pcpu,pid,cmd | sort -nr | head -n 10',

  'dmesg': 'sudo dmesg -H',

  'mem': 'ps -e -orss=,pid=,args= | sort -b -k1n | pr -TW$COLUMNS',

  'cal': 'cal -3wm',
  'caly': '/usr/bin/env cal -wmy',

  'pretend': 'cat /dev/urandom | hexdump | grep --color=auto cafe',
  'cafe': 'pretend',

  # 2017.06.03 para las pelis que tienen bajo volumen
  'mplayer': 'mplayer -cache 8192 -softvol -softvol-max 200 ',

  # 2017.07.20 edit last taken screenshot
  'edit-last-screenshot': 'gimp ~/screenshots/`sl -tr ~/screenshots | tail -n 1`',

  'feh': 'feh --draw-filename --fullscreen --hide-pointer --sort "filename" ',

  'tb': 'nc termbin.com 9999',

  # 2018.12.11 always activate mpg123 play controls
  'mpg': 'mpg123 -C --buffer 10240 *.mp3'
}
