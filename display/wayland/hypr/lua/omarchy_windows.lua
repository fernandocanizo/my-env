-- Omarchy default window and layer rules.
-- Migrated from ~/.local/share/omarchy/default/hypr/windows.conf and apps.conf.
-- Keep rule order aligned with the Hyprlang source: rules are evaluated top to bottom.

local function wr(spec)
  hl.window_rule(spec)
end

local function lr(spec)
  hl.layer_rule(spec)
end

-- windows.conf
wr({ match = { class = ".*" }, suppress_event = "maximize" })
wr({ match = { class = ".*" }, tag = "+default-opacity" })
wr({
  match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
  no_focus = true,
})

-- apps/1password.conf
wr({ match = { class = "^(1[p|P]assword)$" }, no_screen_share = true })
wr({ match = { class = "^(1[p|P]assword)$" }, tag = "+floating-window" })

-- apps/bitwarden.conf
wr({ match = { class = "^(Bitwarden)$" }, no_screen_share = true })
wr({ match = { class = "^(Bitwarden)$" }, tag = "+floating-window" })
wr({ match = { class = "chrome-nngceckbapebfimnlniiiahkandclblb-Default" }, no_screen_share = true })
wr({ match = { class = "chrome-nngceckbapebfimnlniiiahkandclblb-Default" }, tag = "+floating-window" })

-- apps/browser.conf
wr({ match = { class = "((google-)?[cC]hrom(e|ium)|[bB]rave-browser|[mM]icrosoft-edge|Vivaldi-stable|helium)" }, tag = "+chromium-based-browser" })
wr({ match = { class = "([fF]irefox|zen|librewolf)" }, tag = "+firefox-based-browser" })
wr({ match = { tag = "chromium-based-browser" }, tag = "-default-opacity" })
wr({ match = { tag = "firefox-based-browser" }, tag = "-default-opacity" })
wr({ match = { class = "(chrome-youtube.com__-Default|chrome-app.zoom.us__wc_home-Default)" }, tag = "-chromium-based-browser" })
wr({ match = { class = "(chrome-youtube.com__-Default|chrome-app.zoom.us__wc_home-Default)" }, tag = "-default-opacity" })
wr({ match = { tag = "chromium-based-browser" }, tile = true })
wr({ match = { tag = "chromium-based-browser" }, opacity = "1.0 0.97" })
wr({ match = { tag = "firefox-based-browser" }, opacity = "1.0 0.97" })
wr({ match = { title = ".*is sharing.*" }, workspace = "special silent" })

-- apps/hyprshot.conf
lr({ match = { namespace = "selection" }, no_anim = true })

-- apps/jetbrains.conf
wr({ name = "jetbrains-focus", match = { class = "^(jetbrains-.*)$" }, no_follow_mouse = true })

-- apps/localsend.conf
wr({ match = { class = "(Share|localsend)" }, float = true })
wr({ match = { class = "(Share|localsend)" }, center = true })
wr({ match = { class = "localsend" }, size = { 1100, 700 } })

-- apps/pip.conf
wr({ match = { title = "(Picture.?in.?[Pp]icture)" }, tag = "+pip" })
wr({ match = { tag = "pip" }, tag = "-default-opacity" })
wr({ match = { tag = "pip" }, float = true })
wr({ match = { tag = "pip" }, pin = true })
wr({ match = { tag = "pip" }, size = { 600, 338 } })
wr({ match = { tag = "pip" }, keep_aspect_ratio = true })
wr({ match = { tag = "pip" }, border_size = 0 })
wr({ match = { tag = "pip" }, opacity = "1 1" })
wr({ match = { tag = "pip" }, move = { "(monitor_w-window_w-40)", "(monitor_h*0.04)" } })

-- apps/qemu.conf
wr({ match = { class = "qemu" }, tag = "-default-opacity" })
wr({ match = { class = "qemu" }, opacity = "1 1" })

-- apps/retroarch.conf
wr({ match = { class = "com.libretro.RetroArch" }, fullscreen = true })
wr({ match = { class = "com.libretro.RetroArch" }, tag = "-default-opacity" })
wr({ match = { class = "com.libretro.RetroArch" }, opacity = "1 1" })
wr({ match = { class = "com.libretro.RetroArch" }, idle_inhibit = "fullscreen" })

-- apps/steam.conf
wr({ match = { class = "steam" }, float = true })
wr({ match = { class = "steam", title = "Steam" }, center = true })
wr({ match = { class = "steam.*" }, tag = "-default-opacity" })
wr({ match = { class = "steam.*" }, opacity = "1 1" })
wr({ match = { class = "steam", title = "Steam" }, size = { 1100, 700 } })
wr({ match = { class = "steam", title = "Friends List" }, size = { 460, 800 } })
wr({ match = { class = "steam" }, idle_inhibit = "fullscreen" })

-- apps/geforce.conf
wr({ name = "geforce", match = { class = "GeForceNOW" }, idle_inhibit = "fullscreen" })

-- apps/moonlight.conf
wr({ name = "moonlight", match = { class = "com.moonlight_stream.Moonlight" }, fullscreen = true, idle_inhibit = "fullscreen" })

-- apps/system.conf
wr({ match = { tag = "floating-window" }, float = true })
wr({ match = { tag = "floating-window" }, center = true })
wr({ match = { tag = "floating-window" }, size = { 875, 600 } })
wr({ match = { class = "(org.omarchy.bluetui|org.omarchy.impala|org.omarchy.wiremix|org.omarchy.btop|org.omarchy.terminal|org.omarchy.bash|org.codeberg.dnkl.foot|org.gnome.NautilusPreviewer|org.gnome.Evince|com.gabm.satty|Omarchy|About|TUI.float|imv|mpv)" }, tag = "+floating-window" })
wr({
  match = {
    class = "(xdg-desktop-portal-gtk|sublime_text|DesktopEditors|org.gnome.Nautilus)",
    title = "^(Open.*Files?|Open [F|f]older.*|Save.*Files?|Save.*As|Save|All Files|.*wants to [open|save].*|[C|c]hoose.*)",
  },
  tag = "+floating-window",
})
wr({ match = { class = "org.gnome.Calculator" }, float = true })
wr({ match = { class = "org.omarchy.screensaver" }, fullscreen = true })
wr({ match = { class = "org.omarchy.screensaver" }, float = true })
wr({ match = { class = "org.omarchy.screensaver" }, animation = "slide" })
wr({ match = { class = "^(zoom|vlc|mpv|org.kde.kdenlive|com.obsproject.Studio|com.github.PintaProject.Pinta|imv|org.gnome.NautilusPreviewer)$" }, tag = "-default-opacity" })
wr({ match = { class = "^(zoom|vlc|mpv|org.kde.kdenlive|com.obsproject.Studio|com.github.PintaProject.Pinta|imv|org.gnome.NautilusPreviewer)$" }, opacity = "1 1" })
wr({ match = { tag = "pop" }, rounding = 8 })
wr({ match = { tag = "noidle" }, idle_inhibit = "always" })

-- apps/telegram.conf
wr({ match = { class = "org.telegram.desktop" }, focus_on_activate = false })

-- apps/typora.conf
wr({ match = { class = "^Typora$", title = "^Print$" }, float = true, center = true })

-- apps/terminals.conf
wr({ match = { class = "(Alacritty|kitty|com.mitchellh.ghostty|foot)" }, tag = "+terminal" })
wr({ match = { tag = "terminal" }, tag = "-default-opacity" })
wr({ match = { tag = "terminal" }, opacity = "0.97 0.9" })

-- apps/walker.conf
lr({ match = { namespace = "walker" }, no_anim = true })

-- apps/webcam-overlay.conf
wr({ match = { title = "WebcamOverlay" }, float = true })
wr({ match = { title = "WebcamOverlay" }, pin = true })
wr({ match = { title = "WebcamOverlay" }, no_initial_focus = true })
wr({ match = { title = "WebcamOverlay" }, no_dim = true })
wr({ match = { title = "WebcamOverlay" }, move = { "(monitor_w-window_w-40)", "(monitor_h-window_h-40)" } })

-- windows.conf final default opacity rule.
wr({ match = { tag = "default-opacity" }, opacity = "0.97 0.9" })
