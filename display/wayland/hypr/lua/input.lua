-- Input device configuration.
-- Migrated from Omarchy's default hypr/input.conf plus local overrides from ../input.conf.

hl.config({
  input = {
    -- Omarchy defaults.
    kb_layout = "us",
    kb_variant = "altgr-intl",
    kb_model = "",
    kb_options = "compose:caps",
    kb_rules = "",
    follow_mouse = 1,
    sensitivity = 0,

    -- Local overrides.
    repeat_rate = 40,
    repeat_delay = 250,
    numlock_by_default = true,

    touchpad = {
      -- Omarchy default.
      natural_scroll = false,

      -- Local override.
      scroll_factor = 0.4,
    },
  },

  misc = {
    -- Omarchy defaults: key/mouse activity wakes displays.
    key_press_enables_dpms = true,
    mouse_move_enables_dpms = true,
  },
})

local input_config_cmd = [[
(sleep 0.4; hyprctl eval 'hl.config({ input = { kb_layout = "us", kb_variant = "altgr-intl", kb_model = "", kb_options = "compose:caps", kb_rules = "", follow_mouse = 1, sensitivity = 0, repeat_rate = 40, repeat_delay = 250, numlock_by_default = true, touchpad = { natural_scroll = false, scroll_factor = 0.4 } }, misc = { key_press_enables_dpms = true, mouse_move_enables_dpms = true } })' >/dev/null 2>&1 || true) &
]]

local function apply_input_config()
  -- Use os.execute instead of hl.exec_cmd: during `hyprctl reload`, exec_cmd can
  -- be swallowed/cancelled before the delayed hyprctl runs, while a background
  -- shell survives long enough to apply input values after parsing.
  os.execute(input_config_cmd)
end

-- Run once after this module loads, and again after lifecycle events. The shell
-- sleep lets Hyprland finish applying Lua's parsed config before we enforce the
-- values that have historically not always stuck from nested hl.config().
apply_input_config()
hl.on("hyprland.start", apply_input_config)
hl.on("config.reloaded", apply_input_config)

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
