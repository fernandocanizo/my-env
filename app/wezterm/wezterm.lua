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
  -- Disable <CMD-m> hide action, is working like a fullscreen toggle
  -- under i3 and I don't need it
  {
    mods = 'CMD',
    key = 'm',
    action = wezterm.action.DisableDefaultAssignment,
  },
  -- Disable <c-s-t>, I want to use it under Neovim and I already got a mapping
  -- for creating new tabs
  {
    mods = 'CTRL|SHIFT',
    key = 't',
    action = wezterm.action.DisableDefaultAssignment,
  },

  {
    mods = 'CTRL',
    key = 'LeftArrow',
    action = wa.MoveTabRelative(-1)
  },
  {
    mods = 'CTRL',
    key = 'RightArrow',
    action = wa.MoveTabRelative(1)
  },
  {
    mods = 'SHIFT',
    key = 'DownArrow',
    action = wa.SpawnTab("CurrentPaneDomain")
  },
  {
    mods = 'SHIFT',
    key = 'LeftArrow',
    action = wa.ActivateTabRelative(-1)
  },
  {
    mods = 'SHIFT',
    key = 'RightArrow',
    action = wa.ActivateTabRelative(1)
  },
  {
    mods = 'CTRL|SHIFT|ALT',
    key = 'v',
    action = wa.SplitVertical({domain="CurrentPaneDomain"})
  },
  {
    mods = 'CTRL|SHIFT|ALT',
    key = 'h',
    action = wa.SplitHorizontal({domain="CurrentPaneDomain"})
  },
  -- tab renaming
  {
    mods = 'SHIFT',
    key = 'UpArrow',
    action = wa.PromptInputLine {
      description = 'Enter new name for tab',
      action = wezterm.action_callback(function(window, pane, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          window:active_tab():set_title(line)
        end
      end),
    },
  },
  -- end tab renaming
}

-- ALT + number tab switching
for i = 1, 9 do
  table.insert(config.keys, {
    mods = 'ALT',
    key = tostring(i),
    action = wa.ActivateTab(i - 1),
  })
end

-- and finally, return the configuration to wezterm
return config

