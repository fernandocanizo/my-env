-- Local window rules.
-- Migrated from local rules in ../hyprland.conf for Hyprland 0.55 Lua config.

-- Evince is floated by Omarchy defaults. Keep PDFs opened from the CLI on the
-- current workspace as tiled/tabbed instead.
hl.window_rule({
  match = { class = "org.gnome.Evince" },
  tag = "-floating-window",
  tile = true,
})

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
