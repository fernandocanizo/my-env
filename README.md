# my-env

Bash shell configuration, aliases and functions to be at home anywhere easily.

A simple system to get a new host configured with just a couple of commands.

This is a personal configuration, but it may be used as a starting point to make
your own repo to keep you preferred options.

I try to keep a common set of settings which is usable on any new Linux machine,
being it a server or a home desktop, without the need to install anything.

Then there are `host/*` folders which carry configuration specific for that host.
Since they share common stuff, there's a `host/common` folder to carry those and
link them from the proper host folder.

## Installation

```
# you can use any folder name you want, I like to put it under ~/.myenv
git clone https://github.com/fernandocanizo/my-env.git ~/.myenv
cd ~/.myenv
./install
```

**WARNING** `install` script will wipe out current `~/.bash_profile`,
`~/.bashrc` and `~/.bash_logout` files, since this is thought as a way to
quickly set up new hosts, so no care for default configuration files is taken.

If there's something you want to save, then backup your files first.

