-- Staged Hyprland 0.55 Lua entry point.
-- Rename/copy to hyprland.lua only when ready to activate.
-- IMPORTANT: once hyprland.lua exists, Hyprland prefers it over hyprland.conf.

-- Emergency / recovery binds should stay near the top so they survive later module errors.
-- Use chords that do not collide with the main migrated bindings.
local terminal = "xdg-terminal-exec"
local launcher = "omarchy-launch-walker"

hl.bind("SUPER + CTRL + RETURN", hl.dsp.exec_cmd(terminal), { description = "Emergency terminal" })
hl.bind("SUPER + CTRL + R", hl.dsp.exec_cmd(launcher), { description = "Emergency launcher" })
hl.bind("SUPER + CTRL + SHIFT + M", hl.dsp.exec_cmd("uwsm stop"), { description = "Emergency exit Hyprland" })

-- Load hy3 as early as possible. If this fails, looknfeel/bindings using hy3 may fail too.
pcall(function()
  hl.plugin.load("/usr/lib/libhy3.so")
end)

-- Converted local modules. Keep order deliberate: low-risk basics first, hy3-dependent later.
-- Clear package.loaded so `hyprctl reload` re-executes modules instead of using
-- stale Lua require cache.
local function reloadable_require(module)
  package.loaded[module] = nil
  require(module)
end

reloadable_require("lua/monitors")
reloadable_require("lua/envs")
reloadable_require("lua/input")
reloadable_require("lua/looknfeel")
reloadable_require("lua/theme")
reloadable_require("lua/autostart")
reloadable_require("lua/omarchy_windows")
reloadable_require("lua/windowrules")
reloadable_require("lua/bindings")
reloadable_require("lua/toggles")

-- TODO before this becomes the real hyprland.lua:
-- Finish migrating any remaining Omarchy defaults currently sourced by hyprland.conf.
