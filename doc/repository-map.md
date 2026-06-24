# Repository map

This repository manages personal configuration across different machines. The current layout separates universal files, application configs, display-server-specific config, and per-host overrides.

## Installer

`install` is the main script.

- Safe by default: without flags it only prints a dry run.
- `--write` performs linking.
- `--force` removes conflicting destinations before linking.
- `--shell=bash|fish|xonsh|zsh` overrides shell detection.
- `--display=x11|wayland|cli` overrides display detection.
- Host detection always uses `$HOSTNAME`.

The installer records the checkout path in `~/.envFolder`, links universal dotfiles from `home/`, configures the detected shell, then links generic and display-specific app configs.

## Top-level layout

- `home/` — universal files linked into `$HOME` as dotfiles, e.g. `home/gitconfig` -> `~/.gitconfig`.
- `app/` — display-agnostic application configs linked into `~/.config/<app>`.
- `display/` — display-specific config:
  - `display/cli/` for headless/CLI machines.
  - `display/x11/home/` for X11 home dotfiles.
  - `display/x11/app/` for X11 app configs such as i3.
  - `display/wayland/` for Wayland configs such as Hyprland and Waybar.
- `host/common/` — shared shell configuration, completions, autoload snippets, and functions.
- `host/<hostname>/` — machine-specific shell/display overrides and autoload snippets.
- `install-required-apps.sh` and `install-optional-apps.sh` — package installation helpers; currently Arch/yay-oriented.
- `apps.to.install.on.new.machines.md` and `cool.npm.global.packages.md` — human-maintained package notes.
- `tmp/` — scratch area; ignore

## Shell configuration conventions

- Bash is the most complete shell path today.
- `host/common/bash/bashrc` sources shared autoload scripts from `host/common/bash/autoload/*.sh`, then host-specific scripts from `host/$HOSTNAME/bash/autoload/*.sh`.
- Shared Bash functions live in `host/common/bash/functions/`.
- Shared Bash completions live in `host/common/bash/completions/`.
- `fish`, `xonsh`, and `zsh` directories exist as structure/placeholders, with xonsh having some shared scripts.

## Linking model

The installer uses hard links for files and symlinks for directories. Existing files are skipped unless already linked or `--force` is supplied. Stale symlinks are replaced.

## Current caveats

- README and older notes may describe the pre-refactor layout; prefer this document plus the current `install` script.
- Some scripts still assume specific hosts or tools; keep new shared snippets portable and guarded with `command -v` checks.
- Package install helpers are not yet fully integrated with the new installer flow.
