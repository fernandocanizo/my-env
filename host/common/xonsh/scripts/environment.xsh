$PROMPT = '{env_name}{BOLD_GREEN}{user}@{hostname}{BOLD_BLUE} {cwd}{branch_color}{gitstatus: {}}{RESET} {BOLD_BLUE}{prompt_end}{RESET} '

$XONSH_HISTORY_BACKEND = 'sqlite'

$XDG_CONFIG_HOME = '~/.config/'

# less options, -R is to allow ANSI escape sequences
$LESS = '-iCwqf -R'
$PAGER = 'less'
$GREP_COLORS = 'auto'

$MANPAGER = '/bin/less -s'

$EDITOR = '/usr/bin/nvim'

# for crontab
$VISUAL = '/usr/bin/nvim'

# better prompt for mysql
$MYSQL_PS1 = '\u@\h:\d> '

$GIT_TEMPLATE_DIR = $XDG_CONFIG_HOME + '/git/template'

# from Manjaro
$QT_QPA_PLATFORMTHEME = 'qt5ct'
$GTK2_RC_FILES = $HOME + '/.gtkrc-2.0'

# default browser
$BROWSER = '/usr/bin/brave'

$PATH.insert(0, '~/bin')
