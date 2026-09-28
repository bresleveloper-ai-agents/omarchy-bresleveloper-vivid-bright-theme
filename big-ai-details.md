# VIVID BRIGHT — Big AI Details

A hand-made Omarchy theme, built on 2026-09-17 by mixing pieces of other
themes and hand-picked colours. This file records **what every setting is,
where it came from, what was tried and rejected, and how to change things
safely**.

- **Folder:** `~/.config/omarchy/themes/vivid-bright/` for the author's
  hand-made copy. Installed from GitHub, it's
  `~/.config/omarchy/themes/bresleveloper-vivid-bright/`; Omarchy names the
  folder after the repo, `omarchy-bresleveloper-vivid-bright-theme`.
- **Name in the theme picker:** "Vivid Bright" (the picker capitalises the
  folder name, so all-caps "VIVID BRIGHT" isn't possible there)
- **Apply:** `omarchy theme set vivid-bright`
- **Built on:** Omarchy 4.0.3, Hyprland 0.56.2, terminal = foot running herdr
- **Hand-made = unrestricted:** there is no `.git` folder, so Omarchy uses
  every file here as-is (including `hyprland.lua`). Themes installed from
  GitHub can't ship Lua or terminal configs; this one can.

---

## 0. Publishing: live folder vs. GitHub repo

- **Live, hand-made copy:** `~/.config/omarchy/themes/vivid-bright/`. It has
  **no `.git`**, so Omarchy loads everything here, including `hyprland.lua`.
  **Never `git init` in this folder**: Omarchy would then treat the theme
  as downloaded and silently drop `hyprland.lua`.
- **Publishing repo:** `~/Projects/omarchy-bresleveloper-vivid-bright-theme/`,
  a separate git repo holding a copy of this folder **minus** the wallpapers
  that can't be redistributed: `alphacoders-1198002.jpg` (Pikachu), the two
  Raphael Lacoste castle paintings (see §8 and NOTICE.md). Published
  wallpapers: `sniper1-3`, `vulkanite-cosmic` and `water-castle-1-3`. Its README install URL is
  `github.com/bresleveloper-ai-agents/omarchy-bresleveloper-vivid-bright-theme`.
  Installing it creates the theme `bresleveloper-vivid-bright`.
- **Syncing:** edit here, then copy the changed files into the repo (never
  the excluded wallpapers) and commit there.
- **omarchy.org listing:** a PR to `omacom/omarchy-site` with
  `assets/themes/bresleveloper-vivid-bright.webp` (1200x675, under 100 KB),
  staged in `~/Projects/omarchy-site-theme-pr/`, plus a `<figure>` entry in
  `themes/index.html` (alphabetical).
- **Screenshots:** `preview.png` and `preview-2.png` were retaken on
  2026-09-28 on an empty workspace: nvim with `colors.toml`, an eza tree and
  fastfetch without user/host. The old ones showed personal info.

## 1. Files in this theme

| File | What it does | Notes |
|------|--------------|-------|
| `colors.toml` | The palette: 16 terminal slots + named colours + border colours. Omarchy generates most app configs from it (terminals, btop, Neovim, VS Code, bar/menus...) | Header comment lists where each piece came from |
| `hyprland.lua` | Window look: border colours, rounded corners, transparency | **Replaces** Omarchy's generated `hyprland.lua` — see §6 |
| `shell.bar.toml` | Top bar colours and opacity | **Replaces the whole `[bar]` section** of the generated `shell.toml` — see §5 |
| `icons.theme` | Folder/app icon set: `Yaru-olive` | |
| `chromium.theme` | Browser tab colour: `62,200,212` = `#3ec8d4` | Copied from Futurist |
| `backgrounds/` | 10 wallpapers | See §8 |
| `README.md` | Short intro with screenshot and install link | |
| `big-ai-details.md` | This file: full details, sources, commands, definitions | |
| `preview.png` | Screenshot of the theme; also the theme-picker thumbnail | |
| `LICENSE`, `NOTICE.md` | MIT license, and credits with the upstream MIT notices | |
| `preview-2.png` | Second screenshot (water-castle wallpaper, see-through windows). Shown in the README. | |

Files **not** present (Omarchy generates or falls back):
`unlock.png`, `btop.theme`, terminal
configs (`foot.ini` etc. — generated from `colors.toml`), `neovim.lua`,
`vscode.json`, `keyboard.rgb` (the laptop it was built on has no supported RGB keyboard).

### Installing from GitHub vs. by hand

`omarchy theme install <repo>` clones the repo into
`~/.config/omarchy/themes/vivid-bright/` (the name comes from the repo name
with `omarchy-` and `-theme` stripped). **All files stay in that folder**, but
when the theme is applied, `omarchy-theme-set` treats any theme folder that
has a `.git` directory as untrusted and does not stage:

- any `*.lua` file (so **`hyprland.lua` is skipped**: no rounded corners, no
  transparency, and borders come from `colors.toml` instead — which already
  has the same swapped colours),
- `alacritty.toml`, `foot.ini`, `ghostty.conf`, `kitty.conf`, `vscode.json`,
- symlinks.

(Source: `is_denied_installed_file` / `stage_installed_theme` in
`/usr/share/omarchy/bin/omarchy-theme-set`.)

To use `hyprland.lua` after a GitHub install, remove the `.git` folder so the
theme counts as hand-made, then re-apply:

```bash
rm -rf ~/.config/omarchy/themes/vivid-bright/.git
omarchy theme set vivid-bright
```

Trade-off: `omarchy theme update` no longer updates it (it only updates
themes with a `.git` folder).

The README tells users this as the "Window look (manual step)".

---

## 2. Where everything came from

| Piece | Source | Source repo |
|-------|--------|-------------|
| Base palette (everything not listed below) | **Futurist** | https://github.com/benwillems/omarchy-futurist-theme |
| Browser tabs (`chromium.theme`) | Futurist | same |
| Slot 13 `#ffd0dc` | **Sakura Mochi** | https://github.com/OldJobobo/omarchy-sakura-mochi-theme |
| Border colours (swapped) | Sakura Mochi | same |
| Corner/transparency ideas | Sakura Mochi's `hyprland.lua` (read, not copied wholesale) | same |
| Slot 15 teal `#08bdba` | **Oxocarbon** | https://github.com/HANCORE-linux/omarchy-oxocarbon-theme |
| Slot 0, 7, 8, bar, icons | Picked by hand in this session | — |

---

## 3. The 16 colour slots (current)

Omarchy maps names in `colors.toml` to terminal slots. Programs ask for
"red", "bright white" etc.; the slot decides the real colour.

| Slot | Name in `colors.toml` | Colour | Source | Where you see it |
|------|-----------------------|--------|--------|------------------|
| 0 | `background` | `#000000` pure black | hand-picked | Terminal / app / menu backgrounds |
| 1 | `red` | `#e07a62` | Futurist | Errors, deleted lines |
| 2 | `green` | `#6bcf7a` | Futurist | Success, added lines |
| 3 | `yellow` | `#f0b84a` | Futurist | Warnings |
| 4 | `blue` | `#3a8fb0` | Futurist | Folders in `ls`, info |
| 5 | `magenta` | `#d06ae0` | Futurist | "Magenta" output |
| 6 | `cyan` | `#3ec8d4` | Futurist | Symlinks, Starship prompt symbols |
| 7 | `foreground` | `#00fff0` **t, neon aqua** | hand-picked | **All normal text**, bar/menu text, **herdr active-item text** |
| 8 | `muted` | `#006400` **forest neon** | hand-picked | **herdr active-item background**, dim text (hints, comments, autosuggestions) |
| 9 | `bright_red` | `#f09078` | Futurist | Bold/bright red |
| 10 | `bright_green` | `#8ee89a` | Futurist | Bold/bright green |
| 11 | `bright_yellow` | `#ffd078` | Futurist | Bold/bright yellow |
| 12 | `bright_blue` | `#64b8d4` | Futurist | Bold/bright blue |
| 13 | `bright_magenta` | `#ffd0dc` pale pink | Sakura Mochi | Bold/bright magenta |
| 14 | `bright_cyan` | `#7ae8f0` | Futurist | Bold/bright cyan |
| 15 | `bright_foreground` | `#08bdba` **teal** | Oxocarbon | **Cursor**, **herdr hostname** and `+`, "bright white" text, selected-text colour |

Other values in `colors.toml` (all from Futurist unless noted):

| Key | Colour | Notes |
|-----|--------|-------|
| `accent` | `#3ec8d4` | Highlights in apps |
| `selection` | `#173049` | Text-selection background |
| `dark_background` | `#08111c` | Still Futurist navy — slightly *lighter* than the black background |
| `darker_background` | `#050b14` | Same note |
| `lighter_background` | `#173049` | Panels / highlights |
| `dark_foreground` | `#6b8496` | |
| `light_foreground` | `#c5d9e6` | |
| `orange` / `brown` | `#e89a4a` / `#9a6248` | Used by Neovim / VS Code |
| `hyprland_active_border` | `rgba(5aa15dee)` green | Sakura colour, swapped — also in `hyprland.lua` |
| `hyprland_inactive_border` | `rgba(f23888ee) rgba(f0b7cacc) rgba(67dd82aa) 35deg` pink gradient | Same |

### What was tried and rejected

| Slot | Tried | Result |
|------|-------|--------|
| 7 (text) | Futurist `#dceaf2` → `#ffffff` → g1 `#00ff41` → g2 `#00e676` → t `#00fff0` → `#ffffff` → **t `#00fff0`** | g1 looked good on black; t/t2 felt harsh at first but was kept. White was rejected once it was clear slot 7 is *all* text |
| 8 (dim / herdr active bg) | Futurist `#5e7a88` → teal `#08bdba` → `#ffffff` ("ewww") → neon pink `#ff006e` → deep emerald `#004b23` → **forest neon `#006400`** → acid green `#38b000` → raspberry `#c9184a` → hot berry `#8b0a50` → hot pink `#d6336c` → **forest neon `#006400`** ("this is the one") | |
| 15 (cursor / hostname) | Sakura `#fff1f6` → g1 `#00ff41` ("ewww") → **teal `#08bdba`** | |
| 0 (background) | Futurist navy `#0a1624` → **`#000000`** | |

Colour names used in the session: **g1** `#00ff41` matrix green,
**g2** `#00e676` neon green, **t** / **t2** `#00fff0` neon aqua.

---

## 4. herdr (terminal multiplexer) — what controls what

herdr uses its **"terminal"** theme (`~/.config/herdr/config.toml`), so it
takes colours from the terminal slots. Measured on screen:

| herdr element | Slot |
|---------------|------|
| Active space / agent row **background** | slot 8 (`muted`) |
| Active space / agent row **text** | slot 7 (`foreground`) |
| Hostname, `+` | slot 15 (`bright_foreground`) |
| Tab number label (`1`) | `ui.accent = "blue"` → slot 4 |

herdr has no setting for *only* the active row's text colour; it does have
`[theme.custom] active_row_bg` for the background (applies to every theme).

---

## 5. The top bar (`shell.bar.toml`)

| Key | Value | Notes |
|-----|-------|-------|
| `background` | `#006400` forest neon | Same as slot 8 |
| `background-alpha` | `0.5` | 50 % see-through |
| `text` | `#00fff0` | Same as slot 7 |
| `active` | `#e07a62` | Alerts, recording, updates |
| `scale-with-font`, `size-horizontal`, `size-vertical` | `true`, `26`, `28` | Omarchy defaults |

**Important:** a `shell.<section>.toml` file **replaces that entire section**
of the generated `shell.toml` — every key must be present, not just the
changed one.

Tried: `#006400` at 1.0 → 0.75 ("ewww" at 0.75 with forest) → shadow green
`#002200` at 0.75 / 0.5 / 0.85 / 0.55 → **`#006400` at 0.5**.

Other `shell.toml` sections that could be customised the same way:
`[controls]`, `[popups]`, `[tooltip]`, `[notifications]`, `[launcher]`,
`[menu]`, `[polkit]`, `[lock]`, `[image-picker]`, `[spacing]`, `[font]`.
To see a section's keys: `sed -n '/^\[lock\]/,/^\[/p' ~/.local/state/omarchy/current/theme/shell.toml`

---

## 6. Window look (`hyprland.lua`)

Building Sakura Mochi's "glassy" look **one setting at a time**:

| # | Setting | Omarchy default | Sakura Mochi | **Vivid Bright** | Tried |
|---|---------|-----------------|--------------|------------------|-------|
| 1 | `decoration.rounding` | 0 | 14 | **3 (subtle)** | 14, 7, 10, 5, 0, 2, 4 |
| 2 | `general.gaps_in` / `gaps_out` | 5 / 10 | 12 / 24 | **default 5 / 10** | 12 / 24 (rejected) |
| 3 | `decoration.active_opacity` / `inactive_opacity` | 1.0 / 1.0 | 0.97 / 0.95 | **1.0 / 0.7** (focused fully solid) | 0.97 / 0.95, 0.94 / 0.7, 0.9 / 0.7, 0.97 / 0.7 |
| 4 | Blur | off | on (size 6, passes 3, brightness 0.42, contrast 0.87, noise 0.03, vibrancy 0.03) | **off (removed)** | Tried Sakura's values + a bar layer rule. It worked, but mostly showed as a darker background (brightness 0.42) — not liked, removed |
| 5 | Shadows | off | on (range 16, power 3, offset 2 2, colour `rgba(0b0d118c)`) | **off (removed)** | Sakura's (range 16, 55 %), range 48, range 32 at 100 %, range 16 at 100 % with render_power 1 — not liked |
| 6 | Animations | Omarchy's | custom curves `mochiFloat`, `sakuraDrift`, `glassFade`, `workspaceGlide` (popin / slide / slidefade) | **Omarchy's (kept)** | all of Sakura's |

Borders in `hyprland.lua`: active `rgba(5aa15dee)` (green), inactive
Sakura's pink → light-pink → green gradient at 35°. Originally Sakura had
them the other way round; they were **swapped** on request, and the active
green's opacity raised from `99` to `ee`.

### ⚠️ Border colours live in two places

Because this theme ships `hyprland.lua`, Omarchy **no longer generates one
from `colors.toml`**. The border colours are therefore written in both
`colors.toml` (used by the bar/shell for border tokens) and `hyprland.lua`
(used by Hyprland). **Change both together.**

### Quick apply for `hyprland.lua` edits (no full re-apply)

```bash
f=~/.config/omarchy/themes/vivid-bright/hyprland.lua
cp "$f" ~/.local/state/omarchy/current/theme/hyprland.lua
hyprctl reload && hyprctl configerrors      # must print nothing
hyprctl getoption decoration:rounding       # check a value
```

---

## 7. Cursor colour — the hook

Omarchy always draws the cursor in **slot 15**. Early on, slot 15 was
Sakura's pink-white and the teal cursor came from custom terminal configs
shipped in this theme. Open foot windows still turned pink-white, because
`omarchy-theme-set-foot` recolours running terminals from `colors.toml`.

Fix: a theme-set hook (the author's own, **not included** in this repo),
`~/.config/omarchy/hooks/theme-set.d/foot-cursor-from-theme`, which after
every theme change reads the `cursor=` line from the active theme's
`foot.ini` and sends it to open foot windows (OSC 12). It's harmless for
themes without a custom cursor.

Later slot 15 itself became teal, so the custom terminal configs were
**removed** (terminals follow `colors.toml` again). The hook is still
installed and just re-sends the same teal.

---

## 8. Wallpapers (`backgrounds/`)

| File | Source |
|------|--------|
| File | Source | In the published repo? |
|------|--------|---|
| `alphacoders-1198002.jpg` | Pikachu wallpaper from alphacoders.com (image 1198002). Pokémon is Nintendo / The Pokémon Company property. | **No.** Local only: redistribution isn't allowed without the artist's permission. |
| `castle-on-a-lake.jpg`, `castle-afront-a-mountain.jpg` | Day versions from the [Castle On A Lake theme](https://github.com/shmall03/omarchy-castle-on-a-lake-theme) (MIT © 2026 Ben Smith). The paintings themselves are by concept artist **Raphael Lacoste**. | **No.** Local only: the paintings are Raphael Lacoste's artwork, which that repo's MIT license can't cover. Get them from the Castle On A Lake theme. |
| `sniper1.png`, `sniper2.png`, `sniper3.png` | AI re-imaginings of `BG5.jpg` (sniper2 and sniper3 with Google Nano Banana; sniper1 with a BytePlus model, per the content credentials embedded in each file), the neon girl-sniper art in the [Blackturq theme](https://github.com/HANCORE-linux/omarchy-blackturq-theme) (MIT © 2025 HANCORE). Blackturq doesn't say where the original art comes from. | Yes, credited to Blackturq / HANCORE |
| `vulkanite-cosmic.webp` | `4-vulkanite-cosmic.webp` from the [Vulkanite theme](https://github.com/kyerpotts/omarchy-vulkanite-theme) (MIT © 2026 Kyer Potts) | Yes, credited |
| `water-castle-1.png`, `water-castle-2.png`, `water-castle-3.png` | Standalone AI-generated images: `-1` is an ice castle on a lake, `-2` and `-3` an ice palace, with `-3` a brightened variant. They carry Google C2PA "trainedAlgorithmicMedia" credentials. **Not** related to the Castle On A Lake paintings. Created by the theme author (bresleveloper) with Google Gemini / Nano Banana, as confirmed by the author on 2026-09-28. | Yes, the author's own AI-generated images |

An earlier `sniper4.jpg` (Blackturq's original `BG5.jpg`, unchanged) was
removed; the AI versions replace it.

### Adding a wallpaper without re-applying

The background switcher (SUPER + CTRL + SPACE) reads the **applied copy** in
`~/.local/state/omarchy/current/theme/backgrounds/`, not this folder. Copy
new images to **both**:

```bash
for d in ~/.config/omarchy/themes/vivid-bright/backgrounds \
         ~/.local/state/omarchy/current/theme/backgrounds; do
  cp -n new-image.png "$d/"
done
```

---

## 9. How to apply changes

| Changed | How to apply |
|---------|--------------|
| `colors.toml`, `shell.bar.toml`, `icons.theme`, `chromium.theme` | Full re-apply (keeps the current wallpaper): |
| `hyprland.lua` | Quick apply (see §6) |
| New wallpaper | Copy to both folders (see §8) |
| Icons only | `gsettings set org.gnome.desktop.interface icon-theme Yaru-olive` (+ copy `icons.theme` to the applied copy) |

Full re-apply, keeping the current wallpaper:

```bash
bg=$(basename "$(readlink -f ~/.local/state/omarchy/current/background)")
omarchy theme set vivid-bright
omarchy theme bg set ~/.local/state/omarchy/current/theme/backgrounds/$bg
```

(A plain `omarchy theme set` moves to a different wallpaper.)

Checks after applying:

```bash
omarchy theme current
grep -E '^(foreground|background|cursor|bright0|bright7)' ~/.local/state/omarchy/current/theme/foot.ini
sed -n '/^\[bar\]/,/^\[/p' ~/.local/state/omarchy/current/theme/shell.toml
hyprctl getoption general:col.active_border
cat /etc/chromium/policies/managed/color.json
```

---

## 10. Colour-preview tools

Colours were compared with small preview scripts that open a foot window.
They were the author's local helpers and **aren't part of this repo**:

| Script | Shows |
|--------|-------|
| `slots-preview.sh` | The current theme's 16 slots |
| `color-preview.sh` | Any list of hex colours (swatch, text on black) |
| `text-on-bg-preview.sh` | One text colour on many backgrounds (herdr-style row) |
| `bar-preview.sh` | Fake bars with Nerd Font icons on many backgrounds |

---

## 11. Still to try

- **Lock screen** `[lock]` section — e.g. pink gradient border, red on
  wrong password
- **Menus / popups / notifications** borders with the pink/green gradient
- **`unlock.png`** for the unlock screen (`preview.png` is done)
- **Own `btop.theme`**
- **`dark_background` / `darker_background`** — still Futurist navy; could be
  black to match slot 0
- A matching font (`omarchy font list` / `omarchy font set`)

---

## 12. Backups

Earlier `colors.toml` versions were saved only in a temporary session folder
(not permanent). The rejected values are all listed in §3 and §5, so any
earlier state can be rebuilt from this file.
