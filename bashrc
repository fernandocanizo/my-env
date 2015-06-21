
# This file is called when bash is invoked as an interactive non login shell
# and from remote logins. But it's being sourced from ~/.bash_profile to keep
# all configuration in one place


BASH_DIR="$HOME/.bash/src/"

if [[ -d $BASH_DIR ]]; then
	# first load files with no dash in their name
	# consider these files to be sourced on any host

	for FILE in `/usr/bin/env ls -1 $BASH_DIR | /usr/bin/env grep -v '-'`; do
		source ${BASH_DIR}${FILE};
	done

	# then source hostname specific files

	for FILE in `/usr/bin/env ls -1 $BASH_DIR`; do
		if [[ $(echo -n ${FILE} | grep `hostname`) ]]; then
			source ${BASH_DIR}${FILE};
		fi
	done
fi
