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

--
-- Tried color schemes:
--

-- numbers and strings appear in black, which is hard to see with the dark gray background
-- config.color_scheme = 'Solarized Darcula'

-- pretty sane, but had a hard time reading the path information from my prompt
-- config.color_scheme = '3024 (dark) (terminal.sexy)'

-- pretty cool yellow cursor, however sometimes background colors selected for
-- some highlights are hard to read. Not enough contrast.
-- config.color_scheme = 'Batman'

config.color_scheme = 'Adventure'

-- Note (from documentation): the color_scheme option takes precedence over the colors section, and
-- is mutually exclusive with it. Choose one or use
-- `wezterm.color.get_default_colors()` and explicitly merge them.
-- However it seems it doesn't collide with the tab bar colors
config.colors = {
  tab_bar = {
    -- The color of the strip that goes along the top of the window
    -- (does not apply when fancy tab bar is in use)
    background = '#0b0022',

    -- The active tab is the one that has focus in the window
    active_tab = {
      -- The color of the background area for the tab
      bg_color = '#CE71FE',
      -- The color of the text for the tab
      fg_color = '#000000',

      -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
      -- label shown for this tab.
      -- The default is "Normal"
      intensity = 'Bold',
    },

    -- The new tab button that let you create new tabs
    new_tab = {
      bg_color = '#ff1032',
      fg_color = '#000000',
    },
  },
}

-- Spawn a xonsh shell in login mode
-- config.default_prog = { '/usr/bin/env', 'xonsh' }

config.font = wezterm.font 'Terminess Nerd Font Mono'
config.font_size = 20.0

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

