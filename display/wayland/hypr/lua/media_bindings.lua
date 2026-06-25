-- Omarchy default media bindings.
-- Migrated from ~/.local/share/omarchy/default/hypr/bindings/media.conf.

local function bindd(keys, description, command, opts)
  opts = opts or {}
  opts.description = description
  hl.bind(keys, hl.dsp.exec_cmd(command), opts)
end

local locked = { locked = true }
local locked_repeating = { locked = true, repeating = true }

-- Laptop multimedia keys for volume and LCD brightness (with OSD).
bindd("XF86AudioRaiseVolume", "Volume up", "omarchy-swayosd-client --output-volume raise", locked_repeating)
bindd("XF86AudioLowerVolume", "Volume down", "omarchy-swayosd-client --output-volume lower", locked_repeating)
bindd("XF86AudioMute", "Mute", "omarchy-swayosd-client --output-volume mute-toggle", locked_repeating)
bindd("XF86AudioMicMute", "Mute microphone", "omarchy-audio-input-mute", locked_repeating)
bindd("XF86MonBrightnessUp", "Brightness up", "omarchy-brightness-display +5%", locked_repeating)
bindd("XF86MonBrightnessDown", "Brightness down", "omarchy-brightness-display 5%-", locked_repeating)
bindd("SHIFT + XF86MonBrightnessUp", "Brightness maximum", "omarchy-brightness-display 100%", locked_repeating)
bindd("SHIFT + XF86MonBrightnessDown", "Brightness minimum", "omarchy-brightness-display 1%", locked_repeating)
bindd("XF86KbdBrightnessUp", "Keyboard brightness up", "omarchy-brightness-keyboard up", locked_repeating)
bindd("XF86KbdBrightnessDown", "Keyboard brightness down", "omarchy-brightness-keyboard down", locked_repeating)
bindd("XF86KbdLightOnOff", "Keyboard backlight cycle", "omarchy-brightness-keyboard cycle", locked)
bindd("XF86TouchpadToggle", "Toggle touchpad", "omarchy-toggle-touchpad", locked)
bindd("XF86TouchpadOn", "Enable touchpad", "omarchy-toggle-touchpad on", locked)
bindd("XF86TouchpadOff", "Disable touchpad", "omarchy-toggle-touchpad off", locked)

-- Precise 1% multimedia adjustments with Alt modifier.
bindd("ALT + XF86AudioRaiseVolume", "Volume up precise", "omarchy-swayosd-client --output-volume +1", locked_repeating)
bindd("ALT + XF86AudioLowerVolume", "Volume down precise", "omarchy-swayosd-client --output-volume -1", locked_repeating)
bindd("ALT + XF86MonBrightnessUp", "Brightness up precise", "omarchy-brightness-display +1%", locked_repeating)
bindd("ALT + XF86MonBrightnessDown", "Brightness down precise", "omarchy-brightness-display 1%-", locked_repeating)

-- Requires playerctl.
bindd("XF86AudioNext", "Next track", "omarchy-swayosd-client --playerctl next", locked)
bindd("XF86AudioPause", "Pause", "omarchy-swayosd-client --playerctl play-pause", locked)
bindd("XF86AudioPlay", "Play", "omarchy-swayosd-client --playerctl play-pause", locked)
bindd("XF86AudioPrev", "Previous track", "omarchy-swayosd-client --playerctl previous", locked)

-- Switch audio output with Super + Mute.
bindd("SUPER + XF86AudioMute", "Switch audio output", "omarchy-audio-output-switch", locked)
