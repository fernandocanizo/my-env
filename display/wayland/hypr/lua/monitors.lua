-- Monitor and display-scale configuration.
-- Migrated from ../monitors.conf for Hyprland 0.55 Lua config.

-- Optimized for retina-class / HiDPI displays.
hl.env("GDK_SCALE", "1")

hl.monitor({
  output = "",
  mode = "preferred",
  position = "auto",
  scale = 1.5,
  vrr = 1,
})

-- Other useful presets from the legacy config:
--
-- Good compromise for 27" or 32" 4K monitors (fractional):
-- hl.env("GDK_SCALE", "1.75")
-- hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1.6 })
--
-- Straight 1x setup for low-resolution or ultrawide displays:
-- hl.env("GDK_SCALE", "1")
-- hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })
--
-- Portrait/rotated secondary monitor (transform: 1 = 90°, 3 = 270°):
-- hl.monitor({ output = "DP-2", mode = "preferred", position = "auto", scale = 1, transform = 1 })
