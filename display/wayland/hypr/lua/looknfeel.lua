-- Local look-and-feel overrides.
-- Migrated from ../looknfeel.conf for Hyprland 0.55 Lua config.
--
-- hy3 plugin config is intentionally applied through `hyprctl keyword` below.
-- With Lua cold-start/verification, `hl.config({ plugin = { hy3 = ... } })` is
-- parsed before hy3's config keys are registered, producing unknown-key errors.

hl.config({
  general = {
    layout = "hy3",
  },
})

local function apply_hy3_config()
  hl.exec_cmd(table.concat({
    "hyprctl --batch '",
    "keyword plugin:hy3:tab_first_window true;",
    "keyword plugin:hy3:tabs:height 22;",
    "keyword plugin:hy3:tabs:padding 6;",
    "keyword plugin:hy3:tabs:from_top false;",
    "keyword plugin:hy3:tabs:radius 6;",
    "keyword plugin:hy3:tabs:border_width 2;",
    "keyword plugin:hy3:tabs:render_text true;",
    "keyword plugin:hy3:tabs:text_center true;",
    "keyword plugin:hy3:tabs:text_font Sans;",
    "keyword plugin:hy3:tabs:text_height 8;",
    "keyword plugin:hy3:tabs:text_padding 3;",
    "keyword plugin:hy3:tabs:blur true;",
    "keyword plugin:hy3:tabs:opacity 1.0",
    "' >/dev/null 2>&1 || true",
  }))
end

hl.on("hyprland.start", apply_hy3_config)
hl.on("config.reloaded", apply_hy3_config)
