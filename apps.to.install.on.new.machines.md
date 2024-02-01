# Package list to install on new Archlinux based machines

## TODO convertir en una lista que este lista para ser instalada, algo ejecutable

- devbook-bin
- fractus-atlas
- discord
- agave
- qbittorrent
- bash-language-server
- telegram-desktop
- slack-desktop
- racket
- pgadmin4
- legit (El paquete legit-git está abandonado)
  Ambos paquetes abandonados, el repo tampoco ha tenido movimiento desde 2019, aunque no sé si lo necesitará.
  Lo he instalado vía `pnpm`: `npm i -g @captainsafia/legit`

- shutter (I don't recall why I'm not using it, I'm using flameshot now)
- flameshot (using it, loving it!)
- perl-rename
- unrar
- pgcli
- bind (for `dig` and `host` among other tools)
- brave-bin (the non-bin clones a git repo and is too big)
- chromium
- colordiff
- community/rxvt-unicode
- convmv
- dictd
- docker
- docker-compose
- dos2unix
- dosfstools
- dropbox
- dropbox-cli
- encfs
- evince
- feh
- file
- gbt
- gedit
- gimp
- git
- tk (para que ande gitk, que viene con git)
- gitg
- gobby (untested)
- gopass (untested)
- guake
- imv (untested)
- jhead
- jq
- kitty
- lftp
- lshw
- lsof
- mc
- meld
- most
- mpd
- mplayer
- neovim
- nginx
- nmap
- ntop
- opera
- p7zip
- pacman-contrib
- pavucontrol
- pg_activity
- pmount
- postgis
- postgresql
- ripgrep
- ripgrep-all
- rxvt-unicode-terminfo
- scrot
- systemd-urxvt-daemon
- urxvt-perls
- urxvt-tabbedex
- wezterm
- xclip
- youtube-dl
- zip
- pgmodeler (https://pgmodeler.io)
  Me salva las papas cuando necesito generar el diagrama entidad-relación de una base de datos
- [shellcheck](https://www.shellcheck.net)
  Verifies your shell scripts and provides tips on how to improve them.
- [dotenv-linter](https://dotenv-linter.github.io/)

## Database management
Not thoroughly tested, but seems cool:

- [sqltabs](https://www.sqltabs.com/)
- [litecli](https://github.com/dbcli/litecli)
- [peeq](https://github.com/dbhowell/peeq)
- [pgbrowse](https://github.com/Geballin/PgBrowse)
- [pgadmin4](https://www.pgadmin.org/)
