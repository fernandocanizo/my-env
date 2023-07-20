-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'Batman'
config.color_scheme = 'Solarized Darcula'

-- Spawn a xonsh shell in login mode
-- config.default_prog = { '/usr/bin/env', 'xonsh' }

config.font = wezterm.font 'Terminess Nerd Font Mono'
config.font_size = 16.0

local wa = wezterm.action -- just a convenience alias
config.keys = {
  {
    key = 'LeftArrow',
    mods = 'CTRL',
    action = wa.MoveTabRelative(-1)
  },
  {
    key = 'RightArrow',
    mods = 'CTRL',
    action = wa.MoveTabRelative(1)
  },
  {
    key = 'DownArrow',
    mods = 'SHIFT',
    action = wa.SpawnTab("CurrentPaneDomain")
  },
  {
    key = 'LeftArrow',
    mods = 'SHIFT',
    action = wa.ActivateTabRelative(-1)
  },
  {
    key = 'RightArrow',
    mods = 'SHIFT',
    action = wa.ActivateTabRelative(1)
  },
  {
    key = 'v',
    mods = 'CTRL|SHIFT|ALT',
    action = wa.SplitVertical({domain="CurrentPaneDomain"})
  },
  {
    key = 'h',
    mods = 'CTRL|SHIFT|ALT',
    action = wa.SplitHorizontal({domain="CurrentPaneDomain"})
  }
}

-- ALT + number tab switching
for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'ALT',
    action = wa.ActivateTab(i - 1),
  })
end

-- and finally, return the configuration to wezterm
return config

