-- Non-conflicting Omarchy tiling-v2/workspace bindings.
-- Migrated from ~/.local/share/omarchy/default/hypr/bindings/tiling-v2.conf.
--
-- Hy3 does not install keybindings by itself; our hy3 bindings are managed in
-- lua/bindings.lua. This file intentionally skips Omarchy defaults that collide
-- with those hy3 bindings or are dwindle/group-specific.
--
-- Local workspace-number change:
--   SUPER+SHIFT+<number> moves the window silently and keeps the current view.
--   SUPER+SHIFT+ALT+<number> moves the window and follows it.

local function bindd(keys, description, dispatcher, opts)
  opts = opts or {}
  opts.description = description
  hl.bind(keys, dispatcher, opts)
end

-- Close windows.
bindd("SUPER + W", "Close window", hl.dsp.window.close())
bindd("CTRL + ALT + DELETE", "Close all windows", hl.dsp.exec_cmd("omarchy-hyprland-window-close-all"))

-- Non-layout-specific window controls.
bindd("SUPER + F", "Full screen", hl.dsp.window.fullscreen({ mode = 0 }))
bindd("SUPER + CTRL + F", "Tiled full screen", hl.dsp.window.fullscreen_state({ internal = 0, client = 2 }))
bindd("SUPER + ALT + F", "Full width", hl.dsp.window.fullscreen({ mode = 1 }))
bindd("SUPER + O", "Pop window out (float & pin)", hl.dsp.exec_cmd("omarchy-hyprland-window-pop"))
bindd("SUPER + L", "Toggle workspace layout", hl.dsp.exec_cmd("omarchy-hyprland-workspace-layout-toggle"))

-- Switch workspaces with SUPER + [1-9; 0].
for i = 1, 10 do
  local code = i == 10 and 19 or (9 + i)
  local workspace = tostring(i)
  bindd("SUPER + code:" .. code, "Switch to workspace " .. workspace, hl.dsp.focus({ workspace = workspace }))
end

-- Move active window silently with SUPER + SHIFT + [1-9; 0], keeping current view.
for i = 1, 10 do
  local code = i == 10 and 19 or (9 + i)
  local workspace = tostring(i)
  bindd(
    "SUPER + SHIFT + code:" .. code,
    "Move window silently to workspace " .. workspace,
    hl.dsp.window.move({ workspace = workspace, follow = false })
  )
end

-- Move active window and follow it with SUPER + SHIFT + ALT + [1-9; 0].
for i = 1, 10 do
  local code = i == 10 and 19 or (9 + i)
  local workspace = tostring(i)
  bindd(
    "SUPER + SHIFT + ALT + code:" .. code,
    "Move window to workspace " .. workspace,
    hl.dsp.window.move({ workspace = workspace, follow = true })
  )
end

-- Scratchpad defaults that do not collide with hy3.
bindd("SUPER + S", "Toggle scratchpad", hl.dsp.workspace.toggle_special("scratchpad"))
bindd("SUPER + ALT + S", "Move window to scratchpad", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }))

-- Workspace navigation that does not collide with hy3 tab bindings.
bindd("SUPER + CTRL + TAB", "Former workspace", hl.dsp.focus({ workspace = "previous" }))

-- Move current workspace to other monitors.
bindd("SUPER + SHIFT + ALT + LEFT", "Move workspace to left monitor", hl.dsp.workspace.move({ monitor = "l" }))
bindd("SUPER + SHIFT + ALT + RIGHT", "Move workspace to right monitor", hl.dsp.workspace.move({ monitor = "r" }))
bindd("SUPER + SHIFT + ALT + UP", "Move workspace to up monitor", hl.dsp.workspace.move({ monitor = "u" }))
bindd("SUPER + SHIFT + ALT + DOWN", "Move workspace to down monitor", hl.dsp.workspace.move({ monitor = "d" }))

-- Resize active window.
bindd("SUPER + code:20", "Expand window left", hl.dsp.window.resize({ x = -100, y = 0, relative = true }))
bindd("SUPER + code:21", "Shrink window left", hl.dsp.window.resize({ x = 100, y = 0, relative = true }))
bindd("SUPER + SHIFT + code:20", "Shrink window up", hl.dsp.window.resize({ x = 0, y = -100, relative = true }))
bindd("SUPER + SHIFT + code:21", "Expand window down", hl.dsp.window.resize({ x = 0, y = 100, relative = true }))

-- Scroll through existing workspaces with SUPER + scroll.
bindd("SUPER + mouse_down", "Scroll active workspace forward", hl.dsp.focus({ workspace = "e+1" }))
bindd("SUPER + mouse_up", "Scroll active workspace backward", hl.dsp.focus({ workspace = "e-1" }))

-- Cycle monitor scaling with SUPER + /.
bindd("SUPER + code:61", "Cycle monitor scaling", hl.dsp.exec_cmd("omarchy-hyprland-monitor-scaling-cycle"))
bindd("SUPER + ALT + code:61", "Cycle monitor scaling backwards", hl.dsp.exec_cmd("omarchy-hyprland-monitor-scaling-cycle --reverse"))
