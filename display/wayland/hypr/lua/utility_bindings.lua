-- Omarchy default utility bindings.
-- Migrated from ~/.local/share/omarchy/default/hypr/bindings/utilities.conf.
--
-- Intentional local difference: bare Print is not bound to screenshot. Use
-- Ctrl+Print from lua/bindings.lua to avoid accidental screenshots near AltGr.

local function bindd(keys, description, command, opts)
  opts = opts or {}
  opts.description = description
  hl.bind(keys, hl.dsp.exec_cmd(command), opts)
end

local function bind_release(keys, description, command)
  bindd(keys, description, command, { release = true })
end

local function bind_locked(keys, description, command)
  bindd(keys, description, command, { locked = true })
end

-- Menus.
bindd("SUPER + SPACE", "Launch apps", "omarchy-launch-walker")
bindd("SUPER + CTRL + E", "Emoji picker", "omarchy-launch-walker -m symbols")
bindd("SUPER + CTRL + C", "Capture menu", "omarchy-menu capture")
bindd("SUPER + CTRL + O", "Toggle menu", "omarchy-menu toggle")
bindd("SUPER + CTRL + H", "Hardware menu", "omarchy-menu hardware")
bindd("SUPER + ALT + SPACE", "Omarchy menu", "omarchy-menu")
bindd("SUPER + SHIFT + code:201", "Omarchy menu", "omarchy-menu")
bindd("SUPER + ESCAPE", "System menu", "omarchy-menu system")
bind_locked("XF86PowerOff", "Power menu", "omarchy-menu system")
bindd("SUPER + K", "Show key bindings", "omarchy-menu-keybindings")
bindd("XF86Calculator", "Calculator", "gnome-calculator")

-- Aesthetics.
bindd("SUPER + SHIFT + SPACE", "Toggle top bar", "omarchy-toggle-waybar")
bindd("SUPER + CTRL + SPACE", "Theme background menu", "omarchy-menu background")
bindd("SUPER + SHIFT + CTRL + SPACE", "Theme menu", "omarchy-menu theme")
bindd("SUPER + BACKSPACE", "Toggle window transparency", "omarchy-hyprland-window-transparency-toggle")
bindd("SUPER + SHIFT + BACKSPACE", "Toggle window gaps", "omarchy-hyprland-window-gaps-toggle")
bindd("SUPER + CTRL + BACKSPACE", "Toggle single-window square aspect", "omarchy-hyprland-window-single-square-aspect-toggle")

-- Notifications.
bindd("SUPER + COMMA", "Dismiss last notification", "makoctl dismiss")
bindd("SUPER + SHIFT + COMMA", "Dismiss all notifications", "makoctl dismiss --all")
bindd("SUPER + CTRL + COMMA", "Toggle silencing notifications", "omarchy-toggle-notification-silencing")
bindd("SUPER + ALT + COMMA", "Invoke last notification", "makoctl invoke")
bindd("SUPER + SHIFT + ALT + COMMA", "Restore last notification", "makoctl restore")

-- Toggles.
bindd("SUPER + CTRL + I", "Toggle locking on idle", "omarchy-toggle-idle")
bindd("SUPER + CTRL + N", "Toggle nightlight", "omarchy-toggle-nightlight")
bindd("SUPER + CTRL + Delete", "Toggle laptop display", "omarchy-hyprland-monitor-internal toggle")
bindd("SUPER + CTRL + ALT + Delete", "Toggle laptop display mirroring", "omarchy-hyprland-monitor-internal-mirror toggle")
bind_locked("switch:on:Lid Switch", "Turn laptop display off when lid closes with external monitors", "omarchy-hw-external-monitors && omarchy-hyprland-monitor-internal off")
bind_locked("switch:off:Lid Switch", "Turn laptop display on when lid opens", "omarchy-hyprland-monitor-internal on")

-- Captures.
-- Bare Print intentionally omitted; Ctrl+Print is defined in lua/bindings.lua.
bindd("ALT + PRINT", "Screenrecording", "omarchy-menu screenrecord")
bindd("SUPER + PRINT", "Color picker", "pkill hyprpicker || hyprpicker -a")
bindd("SUPER + CTRL + PRINT", "Extract text (OCR) from screenshot", "omarchy-capture-text-extraction")

-- File sharing.
bindd("SUPER + CTRL + S", "Share", "omarchy-menu share")

-- Transcoding.
bindd("SUPER + CTRL + PERIOD", "Transcode", "omarchy-transcode")

-- Reminders.
bindd("SUPER + CTRL + R", "Set reminder", "omarchy-menu reminder-set")
bindd("SUPER + CTRL + ALT + R", "Show reminders", "omarchy-reminder show")
bindd("SUPER + SHIFT + CTRL + R", "Clear reminders", "omarchy-reminder clear")

-- Waybar-less information.
bindd("SUPER + CTRL + ALT + T", "Show time", [[notify-send -u low "    $(date +"%A %H:%M  ·  %d %B %Y  ·  Week %V")"]])
bindd("SUPER + CTRL + ALT + B", "Show battery remaining", [[notify-send -u low "$(omarchy-battery-status)"]])
bindd("SUPER + CTRL + ALT + W", "Show weather", [[notify-send -u low "$(omarchy-weather-status)"]])

-- Control panels.
bindd("SUPER + CTRL + A", "Audio controls", "omarchy-launch-audio")
bindd("SUPER + CTRL + B", "Bluetooth controls", "omarchy-launch-bluetooth")
bindd("SUPER + CTRL + W", "Wifi controls", "omarchy-launch-wifi")
bindd("SUPER + CTRL + T", "Activity", "omarchy-launch-tui btop")

-- Dictation.
bindd("SUPER + CTRL + X", "Toggle dictation", "voxtype record toggle")
bindd("F9", "Start dictation (push-to-talk)", "voxtype record start")
bind_release("F9", "Stop dictation (push-to-talk)", "voxtype record stop")

-- Zoom. Use `hyprctl eval` because `hyprctl keyword` is legacy-only with Lua configs.
bindd("SUPER + CTRL + Z", "Zoom in", [[sh -lc 'z=$(hyprctl getoption cursor:zoom_factor -j | python -c "import json,sys; print(json.load(sys.stdin)[\"float\"] + 1)"); hyprctl eval "hl.config({ cursor = { zoom_factor = $z } })"']])
bindd("SUPER + CTRL + ALT + Z", "Reset zoom", [[hyprctl eval 'hl.config({ cursor = { zoom_factor = 1 } })']])

-- Lock system.
bindd("SUPER + CTRL + L", "Lock system", "omarchy-system-lock")
