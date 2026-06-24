-- Local window rules.
-- Migrated from local rules in ../hyprland.conf for Hyprland 0.55 Lua config.

-- Large centered modal for btop launched from waybar load average.
hl.window_rule({
  name = "btop-modal-float",
  match = { class = "org.omarchy.btop-modal" },
  float = true,
})

hl.window_rule({
  name = "btop-modal-size",
  match = { class = "org.omarchy.btop-modal" },
  size = { 2112, 1320 },
})

hl.window_rule({
  name = "btop-modal-center",
  match = { class = "org.omarchy.btop-modal" },
  center = true,
})
