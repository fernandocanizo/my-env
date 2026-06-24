-- Input device configuration.
-- Migrated from ../input.conf for Hyprland 0.55 Lua config.

hl.config({
  input = {
    -- Keep the values here for cold config parsing. Some input keys currently
    -- do not stick from nested Lua config on reload, so apply_input_config()
    -- below enforces them through hyprctl too.
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

local input_config_cmd = table.concat({
  "(sleep 0.4; hyprctl --batch '",
  "keyword input:kb_layout us;",
  "keyword input:kb_variant altgr-intl;",
  "keyword input:kb_options compose:caps;",
  "keyword input:repeat_rate 40;",
  "keyword input:repeat_delay 250;",
  "keyword input:numlock_by_default true;",
  "keyword input:touchpad:scroll_factor 0.4",
  "' >/dev/null 2>&1 || true) &",
})

local function apply_input_config()
  -- Use os.execute instead of hl.exec_cmd: during `hyprctl reload`, exec_cmd can
  -- be swallowed/cancelled before the delayed hyprctl runs, while a background
  -- shell survives long enough to apply the input keywords after parsing.
  os.execute(input_config_cmd)
end

-- Run once after this module loads, and again after lifecycle events. The shell
-- sleep lets Hyprland finish applying Lua's parsed config before we enforce the
-- values that currently don't stick from nested hl.config().
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
