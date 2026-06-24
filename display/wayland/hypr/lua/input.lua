-- Input device configuration.
-- Migrated from ../input.conf for Hyprland 0.55 Lua config.

hl.config({
  input = {
    -- US layout with AltGr international variant and Caps as Compose.
    kb_layout = "us",
    kb_variant = "altgr-intl",
    kb_options = "compose:caps",

    repeat_rate = 40,
    repeat_delay = 250,
    numlock_by_default = true,

    touchpad = {
      scroll_factor = 0.4,
    },
  },
})

-- Scroll nicely in terminals.
hl.window_rule({
  name = "terminal-touchpad-scroll",
  match = { class = "(Alacritty|kitty|foot)" },
  scroll_touchpad = 1.5,
})

hl.window_rule({
  name = "ghostty-touchpad-scroll",
  match = { class = "com.mitchellh.ghostty" },
  scroll_touchpad = 0.2,
})

-- Optional gestures from the legacy config, kept disabled for now:
-- hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
-- hl.gesture({ fingers = 3, direction = "left", action = hl.dsp.focus({ direction = "left" }) })
-- hl.gesture({ fingers = 3, direction = "right", action = hl.dsp.focus({ direction = "right" }) })
