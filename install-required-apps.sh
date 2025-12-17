#!/bin/bash

# Some configurations, aliases and stuff may break if you don't have these
# installed, so better install them before touching your config files

echo "Install required applications? (y/N)"
read -r answer
if [[ 'y' = "${answer}" ]]; then
  yay -S wezterm git-delta dropbox pass neovim atuin ttf-terminus-nerd guake glow fzf
  # required for Neovim
  yay -S tree-sitter-cli
  # fnm
  yay -S fnm
fi

# TODO
# xcursor-breeze is required by Xresources. Also a comment there talks about
# Cyclone, but I'm not using that cursor theme anymore.
