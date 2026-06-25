-- Non-conflicting Omarchy tiling-v2/workspace bindings.
-- Hy3 tabbed mode is the default; dwindle stays available as a sparse/manual layout.
-- Scrolling layout is intentionally not configured or bound.

local function bindd(keys, description, dispatcher, opts)
  opts = opts or {}
  opts.description = description
  hl.bind(keys, dispatcher, opts)
end

local function set_workspace_layout(layout)
  local extra = ""
  if layout == "hy3" then
    extra = [[
hyprctl eval "hl.dispatch(hl.plugin.hy3.make_group('tab', { ephemeral = 'force' }))" >/dev/null 2>&1 || true
hyprctl eval "hl.dispatch(hl.plugin.hy3.change_group('tab'))" >/dev/null 2>&1 || true
]]
  end

  return hl.dsp.exec_cmd([[
workspace=$(hyprctl activeworkspace -j | jq -r '.id')
hyprctl eval "hl.workspace_rule({ workspace = '$workspace', layout = ']] .. layout .. [[' })"
]] .. extra .. [[
notify-send -u low "󱂬    Workspace layout set to ]] .. layout .. [["
]])
end

local function toggle_hy3_dwindle()
  return hl.dsp.exec_cmd([[
workspace=$(hyprctl activeworkspace -j | jq -r '.id')
layout=$(hyprctl activeworkspace -j | jq -r '.tiledLayout')
if [ "$layout" = "hy3" ]; then
  new_layout=dwindle
else
  new_layout=hy3
fi
hyprctl eval "hl.workspace_rule({ workspace = '$workspace', layout = '$new_layout' })"
if [ "$new_layout" = "hy3" ]; then
  hyprctl eval "hl.dispatch(hl.plugin.hy3.make_group('tab', { ephemeral = 'force' }))" >/dev/null 2>&1 || true
  hyprctl eval "hl.dispatch(hl.plugin.hy3.change_group('tab'))" >/dev/null 2>&1 || true
fi
notify-send -u low "󱂬    Workspace layout set to $new_layout"
]])
end

-- Close windows.
bindd("SUPER + W", "Close window", hl.dsp.window.close())
bindd("CTRL + ALT + DELETE", "Close all windows", hl.dsp.exec_cmd("omarchy-hyprland-window-close-all"))

-- Non-layout-specific window controls.
bindd("SUPER + F", "Full screen", hl.dsp.window.fullscreen({ mode = 0 }))
bindd("SUPER + CTRL + F", "Tiled full screen", hl.dsp.window.fullscreen_state({ internal = 0, client = 2 }))
bindd("SUPER + ALT + F", "Full width", hl.dsp.window.fullscreen({ mode = 1 }))
bindd("SUPER + O", "Pop window out (float & pin)", hl.dsp.exec_cmd("omarchy-hyprland-window-pop"))
bindd("SUPER + T", "Tabbed mode (hy3)", set_workspace_layout("hy3"))
bindd("SUPER + D", "Dwindle mode", set_workspace_layout("dwindle"))
bindd("SUPER + Q", "Toggle workspace layout hy3/dwindle", toggle_hy3_dwindle())

-- Switch workspaces with SUPER + [1-9; 0].
for i = 1, 10 do
  local code = i == 10 and 19 or (9 + i)
  local workspace = tostring(i)
  bindd("SUPER + code:" .. code, "Switch to workspace " .. workspace, hl.dsp.focus({ workspace = workspace }))
end

-- Local workspace-number change:
-- SUPER+SHIFT+<number> moves the window silently and keeps the current view.
-- SUPER+SHIFT+ALT+<number> moves the window and follows it.
for i = 1, 10 do
  local code = i == 10 and 19 or (9 + i)
  local workspace = tostring(i)
  bindd(
    "SUPER + SHIFT + code:" .. code,
    "Move window silently to workspace " .. workspace,
    hl.dsp.window.move({ workspace = workspace, follow = false })
  )
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
