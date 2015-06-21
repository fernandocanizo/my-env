# dot-bash
Bash shell configuration, aliases and functions to be at home anywhere easily.

A simple system to get a new host bash shell configured with just a `git clone ...` command.

Make `~/.bash_profile` source `~/.bashrc` and from there load appropriate stuff from `~/.bash/` directory.

`~/.bash/` contains some files to be sourced always and some to be sourced only if there is a match between `hostname` command and filename. So you just need to name your files contain the hostname in the name, using whatever naming scheme you prefer.
