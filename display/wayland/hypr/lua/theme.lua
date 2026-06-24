-- Omarchy theme integration.
-- Migrated from: source = ~/.config/omarchy/current/theme/hyprland.conf
--
-- Omarchy still generates this file in Hyprlang format. Until upstream themes
-- move to Lua, read the active border color from it and apply the equivalent
-- keywords through hyprctl.

local function read_active_border_color()
  local home = os.getenv("HOME") or ""
  local path = home .. "/.config/omarchy/current/theme/hyprland.conf"
  local file = io.open(path, "r")
  if not file then
    return nil
  end

  for line in file:lines() do
    local color = line:match("^%s*%$activeBorderColor%s*=%s*(.-)%s*$")
    if color and color ~= "" then
      file:close()
      return color
    end
  end

  file:close()
  return nil
end

local function apply_omarchy_theme()
  local active_border_color = read_active_border_color()
  if not active_border_color then
    return
  end

  hl.config({
    general = {
      col = {
        active_border = active_border_color,
      },
    },
    group = {
      col = {
        border_active = active_border_color,
      },
    },
  })
end

hl.on("hyprland.start", apply_omarchy_theme)
hl.on("config.reloaded", apply_omarchy_theme)

-- Also apply during config evaluation so `hyprctl reload` updates theme colors.
apply_omarchy_theme()
