-- Omarchy Hyprland config toggles.
-- Migrated from: source = ~/.local/state/omarchy/toggles/hypr/*.conf
--
-- Omarchy's toggle commands still add/remove Hyprlang snippets in this state
-- directory and then call `hyprctl reload`. Mirror the currently known snippets
-- here so those commands keep working while the main config is Lua.

local home = os.getenv("HOME") or ""
local toggle_dir = home .. "/.local/state/omarchy/toggles/hypr"

local function file_exists(path)
  local file = io.open(path, "r")
  if file then
    file:close()
    return true
  end
  return false
end

local config = {}

if file_exists(toggle_dir .. "/tabbed.conf") then
  config.misc = config.misc or {}
  -- Tabbed mode: keep existing window maximized when new windows open.
  config.misc.on_focus_under_fullscreen = 2
end

if file_exists(toggle_dir .. "/single-window-aspect-ratio.conf") then
  config.layout = config.layout or {}
  -- Avoid overly wide single-window layouts on wide screens.
  config.layout.single_window_aspect_ratio = "1 1"
end

if file_exists(toggle_dir .. "/window-no-gaps.conf") then
  config.general = config.general or {}
  config.decoration = config.decoration or {}

  config.general.gaps_out = 0
  config.general.gaps_in = 0
  config.general.border_size = 0
  config.decoration.rounding = 0
end

hl.config(config)
