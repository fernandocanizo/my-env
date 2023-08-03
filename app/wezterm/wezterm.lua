-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Always start on at $HOME
-- it would be nice to set it up via environment variable
config.default_cwd = "/home/flc/"
wezterm.log_error('Home ' .. wezterm.home_dir)
-- didn't work, I'm gonna leave it here to check if I need to relaunch wezterm
-- from scratch

-- For example, changing the color scheme:
-- config.color_scheme = 'Batman'

-- numbers and strings appear in black, which is hard to see with the dark gray background
-- config.color_scheme = 'Solarized Darcula'

-- pretty sane, but had a hard time reading the path information from my prompt
-- config.color_scheme = '3024 (dark) (terminal.sexy)'

config.color_scheme = 'Adventure'


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

