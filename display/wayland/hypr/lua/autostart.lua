-- Extra autostart processes.
-- Migrated from Omarchy's default hypr/autostart.conf for Hyprland 0.55 Lua config.

hl.on("hyprland.start", function()
  -- Omarchy default: start Waybar unless the user disabled it via the toggle.
  hl.exec_cmd("sh -lc '! omarchy-toggle-enabled waybar-off && uwsm-app -- waybar'")
end)
