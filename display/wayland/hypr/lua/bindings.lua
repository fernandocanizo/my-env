-- Local keybindings.
-- Migrated from ../bindings.conf for Hyprland 0.55 Lua config.

local function bindd(keys, description, dispatcher, opts)
  opts = opts or {}
  opts.description = description
  hl.bind(keys, dispatcher, opts)
end

local function hypr_dispatch(dispatcher, args)
  local cmd = "hyprctl dispatch " .. dispatcher
  if args and args ~= "" then
    cmd = cmd .. " " .. args
  end
  return hl.dsp.exec_cmd(cmd)
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

-- hy3: group creation (i3-style splits and tabs).
bindd("SUPER + H", "Make horizontal split", hypr_dispatch("hy3:makegroup", "h"))
bindd("SUPER + G", "Make vertical split", hypr_dispatch("hy3:makegroup", "v"))
bindd("SUPER + T", "Make tab group", hypr_dispatch("hy3:makegroup", "tab"))
bindd("SUPER + Q", "Toggle group tabbed/untabbed", hypr_dispatch("hy3:changegroup", "toggletab"))

-- hy3: change existing group layout.
bindd("SUPER + SHIFT + H", "Change group to horizontal", hypr_dispatch("hy3:changegroup", "h"))
bindd("SUPER + SHIFT + G", "Change group to vertical", hypr_dispatch("hy3:changegroup", "v"))
bindd("SUPER + SHIFT + T", "Change group to tabbed", hypr_dispatch("hy3:changegroup", "tab"))
bindd("SUPER + SHIFT + Q", "Toggle group orientation", hypr_dispatch("hy3:changegroup", "opposite"))

-- hy3: focus movement.
bindd("SUPER + LEFT", "Focus left", hypr_dispatch("hy3:movefocus", "l"))
bindd("SUPER + RIGHT", "Focus right", hypr_dispatch("hy3:movefocus", "r"))
bindd("SUPER + UP", "Focus up", hypr_dispatch("hy3:movefocus", "u"))
bindd("SUPER + DOWN", "Focus down", hypr_dispatch("hy3:movefocus", "d"))

-- hy3: move windows in tree.
bindd("SUPER + SHIFT + LEFT", "Move window left", hypr_dispatch("hy3:movewindow", "l"))
bindd("SUPER + SHIFT + RIGHT", "Move window right", hypr_dispatch("hy3:movewindow", "r"))
bindd("SUPER + SHIFT + UP", "Move window up", hypr_dispatch("hy3:movewindow", "u"))
bindd("SUPER + SHIFT + DOWN", "Move window down", hypr_dispatch("hy3:movewindow", "d"))

-- hy3: tab cycling within a tabbed group.
bindd("SUPER + TAB", "Next tab", hypr_dispatch("hy3:focustab", "r wrap"))
bindd("SUPER + SHIFT + TAB", "Previous tab", hypr_dispatch("hy3:focustab", "l wrap"))
bindd("ALT + TAB", "Next tab", hypr_dispatch("hy3:focustab", "r wrap"))
bindd("ALT + SHIFT + TAB", "Previous tab", hypr_dispatch("hy3:focustab", "l wrap"))

-- Mouse.
-- hy3's mouse dispatcher is invoked through hyprctl because Lua stubs do not expose plugin dispatchers.
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
