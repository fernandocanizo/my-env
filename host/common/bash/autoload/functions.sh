# vim: set filetype=bash expandtab tabstop=2 shiftwidth=2 softtabstop=2 smartindent

extract () {
	# uncompress any known compressed file
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2) tar xvjf $1 ;;
			*.tar.gz) tar xvzf $1 ;;
			*.bz2) bunzip2 $1 ;;
			*.rar) unrar x $1 ;;
			*.gz) gunzip $1 ;;
			*.tar) tar xvf $1 ;;
			*.tbz2) tar xvjf $1 ;;
			*.tgz) tar xvzf $1 ;;
			*.zip) unzip $1 ;;
			*.Z) uncompress $1 ;;
			*.7z) 7z x $1 ;;
			*) echo "don't know how to extract '$1'..." ;;
		esac
	else
		echo "'$1' is not a valid file!"
	fi
}

bashDebug() {
	# more precise bash debugging, use it like:
	# bashdebug /path/to/script.sh
	env PS4=' ${BASH_SOURCE}:${LINENO}(${FUNCNAME[0]}) ' sh -x $1;
}

crontest () {
	# for testing cronjobs: spits a crontab line with time one minute ahead in the future
	date '-d +1 minutes' +'%M %k %d %m *'
}

col() {
	# source: http://bashoneliners.com/main/oneliner/90/
	# The function will execute awk, and it expects standard input (coming from a
	# pipe or input redirection)

	# The function arguments are processed with sed to use them with awk: replace all
	# spaces with ,$ so that for example 1 2 3 becomes 1,$2,$3, which is inserted
	# into the awk command to become the well formatted shell command: awk '{print
	# $1,$2,$3}'

	# Example: ls | col 2

	awk '{print $'$(echo $* | sed -e 's/ /,$/g')'}';
}

mcd() {
	# 2015.06.05
	# I started keeping track of all projects and things started by prefixing
	# directories with the date, but that made cd-ing into them cumbersome, so this
	# is a cool function which will grep the list of directories and get into the
	# first one from the results

	# Will clobber mtools mcd command if you have it installed
	# But I never use mtools anyway

	found_dir=$(find -maxdepth 1 -type d | grep -v '^.$' | sort | grep -i $1 | head -n 1)
	if [[ -n $found_dir ]]; then
		cd $found_dir
	fi
}

git-span() {
	# 2015.06.20
	# report time span for a project
	git log | grep '^Date' | tail -n 1
	git log | grep '^Date' | head -n 1
}

find-biggest-dirs () {
	# find biggest directories on provided path

	if [[ -z $1 ]]; then
		echo "Please provide a path to search"
		return 0
	fi

	sudo du --one-file-system --summarize "$1/*" | /usr/bin/env sort --numeric-sort --reverse
}

find-biggest-dirs-h () {
	# find biggest directories on provided path, with human numbers

	if [[ -z $1 ]]; then
		echo "Please provide a path to search"
		return 0
	fi

	sudo du --human-readable --summarize --one-file-system "$1/*" | sort --human-numeric-sort --reverse
}

find-biggest-files () {
	# find biggest files on provided path or from root if no path provided
	# uses `sudo` for searching from root

	if [[ -z $1 ]]; then
		sudo find / -xdev -type f -printf "%s %p\n" | sort --numeric --reverse | head -n 20 | numfmt --to=iec
	else
		find "$1" -xdev -type f -printf "%s %p\n" | sort --numeric --reverse | head -n 20 | numfmt --to=iec
	fi
}

function pkgpage () {
	# open URL of an Archlinux package
	url=$(yaourt -Si $1 | grep -E '^URL' | grep -E -o 'https?://[^ ]+')
	echo "Opening ${url} ..."
	chromium ${url}
}

owner () {
	# get command package owner
	pacman -Qo `whereis $1 | awk '{print $2}'`
}

whatelse () {
	# check what other commands/files are provided by a command package owner
	package=`owner ${1} | sed -e 's/.*is owned by \([[:alpha:]]\+\).*/\1/'`
	pacman -Ql $package | grep 'bin'
}

pretendInstall() {
	for i in `seq 0 100`; do
		timeout 1 dialog --gauge "Install..." 6 40 "$i"
	done
	reset
}

pretendGarbage() {
	while (true) ; do
		pwgen -ny 72
		sleep 1
	done
}

getMovieLength () {
	# get movie length
	mplayer -vo null -ao null -frames 0 -identify $1 2> /dev/null |
		gawk '{FS="="}; /ID_LENGTH/{ H=int($2/3600); M=int(($2-H*3600)/60); S=int($2%60); printf("%02d:%02d:%02d\n", H, M, S)}'
}

removePdfPassword() {
	# Remove password from any pdf in current or sub directories
	# doesnt require knowing the password to pdf
	for z in */*.pdf; do gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile="$z new" -c .setpdfwrite -f "$z" mv "$z new" "$z"; done
}

calc() {
	# quick calculator
	echo "$*" | bc -l
}

function cue() {
	# remind you of something to do later
	if [[ $# -eq 0 ]]; then
		echo "Usage: $0 <time> <text string>"
	else
		sleep $1 && shift && zenity --title 'Remind that...' --info --text "$*" &
	fi
}
