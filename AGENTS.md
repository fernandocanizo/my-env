# AGENTS.md

This repo is a personal, multi-machine environment/configuration repository. It keeps shared dotfiles, shell setup, app configs, display configs, and host-specific overrides installable from one checkout.

Keep this file short. For the repository map and conventions, see [`doc/repository-map.md`](doc/repository-map.md).

## Quick facts

- Main entry point: `./install`.
- Default install mode is a dry run; use `./install --write` to link files and `--force` to overwrite conflicts.
- Detection: shell from `$SHELL`, display from Wayland/X11 env vars, host from `$HOSTNAME`.
- Files are hard-linked, folders use symbolic links
- Universal home dotfiles live in `home/` and are linked as `~/.<name>`.
- Display-agnostic app configs live in `app/` and are linked under `~/.config/`.
- Display-specific configs live in `display/{cli,x11,wayland}/`.
- Shared and host-specific shell config lives in `host/common/` and `host/<hostname>/`.

## Working guidelines

- Prefer adding shared behavior under `host/common/`; only put machine-specific values under `host/<hostname>/`.
- Keep shell snippets defensive: commands may run on minimal machines or servers where optional programs are missing.
- Test installer changes with the default dry run before using `--write`.
- Do not touch untracked scratch/local folders unless explicitly asked.
