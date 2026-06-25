-- Omarchy default clipboard bindings.
-- Migrated from ~/.local/share/omarchy/default/hypr/bindings/clipboard.conf.

local function bindd(keys, description, dispatcher, opts)
  opts = opts or {}
  opts.description = description
  hl.bind(keys, dispatcher, opts)
end

bindd("SUPER + C", "Universal copy", hl.dsp.send_shortcut({ mods = "CTRL", key = "Insert", window = "activewindow" }))
bindd("SUPER + V", "Universal paste", hl.dsp.send_shortcut({ mods = "SHIFT", key = "Insert", window = "activewindow" }))
bindd("SUPER + X", "Universal cut", hl.dsp.send_shortcut({ mods = "CTRL", key = "X", window = "activewindow" }))
bindd("SUPER + CTRL + V", "Clipboard manager", hl.dsp.exec_cmd("omarchy-launch-walker -m clipboard"))
