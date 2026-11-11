# Hyprland configuration

## Telegram shortcut

**Super + Alt + T** toggles Telegram without closing it. A visible Telegram window
on the current workspace is moved to the hidden `special:telegram` workspace.
Pressing the shortcut again brings it to the current workspace and focuses it.
If Telegram is in the system tray or not running, the shortcut launches/activates it.
Existing shortcuts are unchanged. Requires `python3`, `hyprctl`, and `Telegram`.

Run the isolated toggle tests (no real windows are changed):

```sh
python3 ~/.config/hypr/scripts/test-telegram-toggle.py
```

These files are from external applications, not hyprland per se, so they stays as `.conf`:

display/wayland/hypr/hypridle.conf
display/wayland/hypr/hyprlock.conf
display/wayland/hypr/hyprsunset.conf
display/wayland/hypr/xdph.conf
