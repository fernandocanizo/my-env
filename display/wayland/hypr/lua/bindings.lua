-- Local keybindings.
-- Migrated from ../bindings.conf for Hyprland 0.55 Lua config.

local function bindd(keys, description, dispatcher, opts)
  opts = opts or {}
  opts.description = description
  hl.bind(keys, dispatcher, opts)
end

local function hypr_dispatch(dispatcher, args)
  local cmd = dispatcher
  if args and args ~= "" then
    cmd = cmd .. " " .. args
  end
  return hl.dsp.exec_raw(cmd)
end

-- Application bindings
bindd("SUPER + RETURN", "Terminal", hl.dsp.exec_cmd([[uwsm-app -- xdg-terminal-exec --dir="$(omarchy-cmd-terminal-cwd)"]]))
bindd("SUPER + ALT + RETURN", "Tmux", hl.dsp.exec_cmd([[uwsm-app -- xdg-terminal-exec --dir="$(omarchy-cmd-terminal-cwd)" bash -c "tmux attach || tmux new -s Work"]]))
bindd("SUPER + SHIFT + RETURN", "Browser", hl.dsp.exec_cmd("omarchy-launch-browser"))
bindd("SUPER + SHIFT + F", "File manager", hl.dsp.exec_cmd("uwsm-app -- nautilus --new-window"))
bindd("SUPER + ALT + SHIFT + F", "File manager (cwd)", hl.dsp.exec_cmd([[uwsm-app -- nautilus --new-window "$(omarchy-cmd-terminal-cwd)"]]))
bindd("SUPER + SHIFT + B", "Browser", hl.dsp.exec_cmd("omarchy-launch-browser"))
bindd("SUPER + SHIFT + ALT + B", "Browser (private)", hl.dsp.exec_cmd("omarchy-launch-browser --private"))
bindd("SUPER + SHIFT + M", "Music", hl.dsp.exec_cmd("omarchy-launch-or-focus spotify"))
bindd("SUPER + SHIFT + ALT + M", "Music TUI", hl.dsp.exec_cmd("omarchy-launch-or-focus-tui cliamp"))
bindd("SUPER + SHIFT + N", "Editor", hl.dsp.exec_cmd("omarchy-launch-editor"))
bindd("SUPER + SHIFT + D", "Docker", hl.dsp.exec_cmd("omarchy-launch-tui lazydocker"))
bindd("SUPER + SHIFT + G", "Signal", hl.dsp.exec_cmd([[omarchy-launch-or-focus ^signal$ "uwsm-app -- signal-desktop"]]))
bindd("SUPER + SHIFT + O", "Obsidian", hl.dsp.exec_cmd([[omarchy-launch-or-focus ^obsidian$ "uwsm-app -- obsidian"]]))
bindd("SUPER + SHIFT + W", "Typora", hl.dsp.exec_cmd("uwsm-app -- typora --enable-wayland-ime"))
bindd("SUPER + SHIFT + SLASH", "Passwords", hl.dsp.exec_cmd("uwsm-app -- 1password"))
bindd("CTRL + F12", "Guake toggle", hl.dsp.exec_cmd("guake -t"))

-- Unbind keys we are replacing from defaults.
for _, keys in ipairs({
  "SUPER + S",
  "SUPER + T",
  "SUPER + Q",
  "SUPER + G",
  "ALT + TAB",
  "ALT + SHIFT + TAB",
  "SUPER + TAB",
  "SUPER + SHIFT + TAB",
  "SUPER + ALT + TAB",
  "SUPER + ALT + SHIFT + TAB",
  "PRINT",

  -- Omarchy tiling defaults replaced with hy3.
  "SUPER + LEFT",
  "SUPER + RIGHT",
  "SUPER + UP",
  "SUPER + DOWN",
  "SUPER + SHIFT + LEFT",
  "SUPER + SHIFT + RIGHT",
  "SUPER + SHIFT + UP",
  "SUPER + SHIFT + DOWN",
  "SUPER + J",
  "SUPER + mouse:272",
}) do
  hl.unbind(keys)
end

local hy3 = hl.plugin.hy3

-- hy3: group creation (i3-style splits and tabs).
bindd("SUPER + H", "Make horizontal split", hy3.make_group("h"))
bindd("SUPER + G", "Make vertical split", hy3.make_group("v"))

-- hy3: change existing group layout.
bindd("SUPER + SHIFT + H", "Change group to horizontal", hy3.change_group("h"))
bindd("SUPER + SHIFT + G", "Change group to vertical", hy3.change_group("v"))
bindd("SUPER + SHIFT + T", "Change group to tabbed", hy3.change_group("tab"))
bindd("SUPER + SHIFT + Q", "Toggle group orientation", hy3.change_group("opposite"))

-- hy3: focus movement.
bindd("SUPER + LEFT", "Focus left", hy3.move_focus("l"))
bindd("SUPER + RIGHT", "Focus right", hy3.move_focus("r"))
bindd("SUPER + UP", "Focus up", hy3.move_focus("u"))
bindd("SUPER + DOWN", "Focus down", hy3.move_focus("d"))

-- hy3: move windows in tree.
bindd("SUPER + SHIFT + LEFT", "Move window left", hy3.move_window("l"))
bindd("SUPER + SHIFT + RIGHT", "Move window right", hy3.move_window("r"))
bindd("SUPER + SHIFT + UP", "Move window up", hy3.move_window("u"))
bindd("SUPER + SHIFT + DOWN", "Move window down", hy3.move_window("d"))

-- Simple native window cycling.
bindd("SUPER + TAB", "Next window", hl.dsp.window.cycle_next())
bindd("SUPER + SHIFT + TAB", "Previous window", hl.dsp.window.cycle_next({ prev = true }))
bindd("ALT + TAB", "Next window", hl.dsp.window.cycle_next())
bindd("ALT + SHIFT + TAB", "Previous window", hl.dsp.window.cycle_next({ prev = true }))

-- Mouse.
-- Mouse drag uses the raw plugin dispatcher because hy3's Lua move_window factory expects a direction.
bindd("SUPER + mouse:272", "Move window", hypr_dispatch("hy3:movewindow"), { mouse = true })
bindd("SUPER + mouse:273", "Resize window", hl.dsp.window.resize(), { mouse = true })

-- Scratchpad.
bindd("SUPER + MINUS", "Toggle scratchpad", hl.dsp.workspace.toggle_special("scratchpad"))
bindd("SUPER + SHIFT + MINUS", "Move window to scratchpad", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }))
bindd("SUPER + ALT + MINUS", "Extract window from scratchpad", hl.dsp.exec_cmd("omarchy-hyprland-scratchpad-extract"))

-- Remap Print Screen to require Ctrl.
bindd("CTRL + PRINT", "Screenshot", hl.dsp.exec_cmd("omarchy-capture-screenshot"))

-- Move original togglefloating to free key.
bindd("SUPER + CTRL + T", "Toggle window floating/tiling", hl.dsp.window.float())
