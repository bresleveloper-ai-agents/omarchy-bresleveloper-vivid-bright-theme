# Troubleshooting

Known issues with this theme and how to fix them.

Tested on Omarchy 4.0.3 / Hyprland 0.56.2 / omacalc 0.2.2.

---

## The calculator (omacalc) opens as a blank, see-through window

### Symptom

`SUPER + CTRL + Q` (or running `omacalc`) opens a window that draws nothing.
The desktop shows through it, so on a dark background it reads as a black
rectangle. The window is the right size and accepts input — only its colours
are missing. It never crashes.

### Cause

`omacalc` reads its four colours straight out of this theme's `colors.toml`:

| Key | What it paints in the calculator |
|---|---|
| `background` | the page, and the base of every key |
| `foreground` | all digits, symbols, key borders, and the `=` key fill |
| `accent` | barely used on the keypad |
| `selection` | barely used on the keypad |

The whole calculator face is blends of `background` and `foreground`, so if
either one fails to parse, the entire UI disappears at once.

Its parser only strips `#` comments that start at the **beginning of a line**.
A comment placed *after* a value is handed through as part of the value:

```toml
background = "#000000"    # slot 0 - pure black
```

becomes the literal string `"#000000"    # slot 0 - pure black`, which is not a
colour. The failed value does **not** fall back to a default — it becomes
fully transparent, which is why the whole window goes see-through.

This file is perfectly valid TOML. Every other app that reads it (Hyprland,
alacritty, btop, the bar) is fine. Only `omacalc` trips on it.

### Fix

Put comments on their own line, above the value:

```toml
# slot 0 - pure black
background = "#000000"
# slot 7 - t neon aqua
foreground = "#00fff0"
```

Then re-apply the theme so the staged copy picks it up:

```sh
omarchy theme set "Vivid Bright"
```

This is already fixed in this repo. Keep it that way when editing colours.

### Rule of thumb

In `colors.toml`, never put a comment on the same line as a value. It costs
nothing to write it above, and it keeps `omacalc` working.

To check a theme before using it:

```sh
grep -nE '^[a-z_]+ *= *"[^"]*" +#' colors.toml
```

Any output is a line that will break the calculator.

### Note on legibility

With `background = "#000000"` and `foreground = "#00fff0"`, the calculator is
pure black with neon aqua keys. The number keys sit "almost flush with the
page" by design, so they stay subtle against pure black. That is the theme
working as intended, not the bug above — the bug makes the window fully
invisible, not merely dark.

---

## Unrelated: the calculator opens at the wrong size

If `omacalc` opens stretched instead of its usual 400x568, delete its saved
window state and reopen it:

```sh
rm ~/.config/Omacom/omacalc.conf
```

The file is regenerated on exit. This is an omacalc bug, not a theme issue:
it can persist `maximized=true` while Omarchy's rules float the window.
