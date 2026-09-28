-- VIVID BRIGHT - window look
--
-- A theme that ships its own hyprland.lua replaces the one Omarchy would
-- generate from colors.toml, so the border colours are repeated here.
-- If you change hyprland_active_border / hyprland_inactive_border in
-- colors.toml, change them here too.
--
-- Window-look settings borrowed from Sakura Mochi are added one by one below.

-- Borders: Sakura Mochi colours, swapped (active = green, inactive = pink gradient)
local active_border_color = "rgba(5aa15dee)"
local inactive_border_color = { colors = { "rgba(f23888ee)", "rgba(f0b7cacc)", "rgba(67dd82aa)" }, angle = 35 }

hl.config({
  general = {
    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
    -- 2. Gaps: tried Sakura Mochi's 12 / 24, kept Omarchy's default 5 / 10
  },

  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
    },
  },

  decoration = {
    -- 1. Corners (Sakura Mochi: 14, Omarchy default: 0, chosen: 3 - subtle)
    rounding = 3,

    -- 3. Transparency (Sakura Mochi: 0.97 / 0.95, Omarchy default: 1.0 / 1.0, chosen: 1.0 / 0.7)
    active_opacity = 1.0,
    inactive_opacity = 0.7,

    -- 4. Blur: tried Sakura Mochi's blur (it darkened the background) - not liked, removed

    -- 5. Shadows: tried Sakura's and darker/wider variants - not liked, removed
  },
})


-- 6. Animations: tried all of Sakura Mochi's - kept Omarchy's
