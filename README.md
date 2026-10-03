# dotfiles

Personal configuration for an Arch Linux workstation built around Hyprland, Waybar, Kitty, Zsh, Neovim, and Vicinae.

The repository is managed as a **bare Git repository** whose work tree is `$HOME`. Files are checked out directly to their normal locations—there is no symlink farm or bootstrap framework.

## What's included

| Path | Purpose |
| --- | --- |
| `.config/hypr/` | Hyprland, Hypridle, Hyprpaper, keybindings, window rules, and wallpaper |
| `.config/waybar/` | Multi-monitor Waybar layout, styling, menus, MPD controls, and dictation status |
| `.config/mako/` | Mako notification colors and timeout |
| `.config/kitty/` | Kitty settings and Tomorrow Night Bright theme |
| `.config/nvim/` | Neovim configuration, plugins, LSP setup, completion, and custom Tomorrow theme |
| `.config/vicinae/` | Vicinae launcher appearance and behavior |
| `.local/share/vicinae/themes/` | Custom Tomorrow Night Bright theme for Vicinae |
| `.config/starship.toml` | Minimal Starship prompt configuration |
| `.local/bin/wiggly-stt-*` | Local Whisper-based dictation controls for Hyprland |
| `.zshenv`, `.zshrc` | Shell environment, aliases, completion, fzf, Starship, NVM, and the `dots` command |

### Desktop

The Hyprland configuration uses a dwindle layout with Vim-style focus and window movement, numbered workspaces, groups, a scratch workspace, a resize submap, multimedia keys, and Vicinae on `Super+D`.

Hyprland starts:

- Vicinae
- Waybar
- Hyprpaper
- Hypridle
- `hyprpolkitagent`

Waybar is configured for the display names `DP-1`, `DP-2`, and `eDP-1`. Its modules include Hyprland workspaces and submaps, the active window, MPD, CPU, memory, temperature, clock, tray, power controls, and Wiggly dictation status.

### Neovim

Neovim bootstraps [lazy.nvim](https://github.com/folke/lazy.nvim) and includes:

- Telescope with native fzf search
- Treesitter
- Lualine
- Fugitive and Octo for Git/GitHub workflows
- `nvim-cmp`, autopairs, surround, and automatic tag handling
- Mason and native Neovim LSP configuration
- Language-server configuration for TypeScript, Astro, Tailwind CSS, Go, ESLint, Biome, and Lua
- Markdown preview, Dadbod, Undotree, Floaterm, and Supermaven
- A custom Tomorrow colorscheme and development-oriented key mappings

### Wiggly dictation

`Ctrl+Space` toggles local speech-to-text recording. Audio is captured with FFmpeg, transcribed locally with `whisper-cli`, copied with `wl-copy`, and inserted into the focused application with `wtype`. `Escape` cancels while the Hyprland `dictation` submap is active.

The Waybar microphone indicator reflects whether recording is idle or active. Model and inference settings are host-specific and intentionally excluded from Git.

## Installation

> These are personal dotfiles, not a general-purpose installer. Review the files before checking them out because they write directly into `$HOME` and may conflict with existing configuration.

Clone the repository as a bare repo:

```bash
git clone --bare https://github.com/rwyde/dotfiles.git "$HOME/.dotfiles"
```

Define the management alias for the current shell:

```bash
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
```

Check out the files:

```bash
dots checkout
```

If checkout reports conflicts, move or remove the listed files and run `dots checkout` again. Then hide unrelated files in `$HOME` from status output:

```bash
dots config --local status.showUntrackedFiles no
```

After checkout, future operations use the `dots` alias included in `.zshrc`:

```bash
dots status
dots add ~/.config/nvim/init.lua
dots commit
dots push
```

## Host-specific configuration

Two machine-local files are deliberately ignored:

### Hyprland displays

Create `~/.config/hypr/machine.conf` with the monitor layout and workspace routing for the machine. It is sourced by `hyprland.conf`.

A minimal example:

```ini
monitor = , preferred, auto, 1
```

The tracked Waybar output names may also need adjustment for a different display layout.

### Wiggly inference

Create `~/.local/share/wiggly-stt/wiggly-stt.conf` when the defaults are not appropriate:

```bash
MODEL_PATH="${HOME}/.models"
DEFAULT_MODEL="ggml-large-v3-turbo.bin"
WHISPER_THREADS=""
WHISPER_NO_GPU="0"
```

The fallback model is `ggml-base.en.bin`. Whisper model files are not included in this repository.

Shell secrets belong in `~/.zshsecrets`, which `.zshenv` loads when present. Credentials and machine-specific secrets are not tracked.

## Dependencies

This setup assumes Arch Linux and a working Wayland/Hyprland installation. Important runtime dependencies include:

- `hyprland`, `hypridle`, `hyprpaper`, `hyprpolkitagent`
- `waybar`, `mako`, `kitty`, `vicinae`
- `zsh`, `starship`, `fzf`, `ripgrep`, `neovim`, `git`
- `dolphin`, `brightnessctl`, `playerctl`, `wireplumber`
- `mpd` and `rmpc` for the music module
- `ffmpeg`, `whisper-cli`, `wtype`, `wl-clipboard`, `jq`, `libnotify`, and `flock` for Wiggly dictation
- A Nerd Font for status-bar and editor icons

Neovim plugins install themselves through lazy.nvim. Language servers and external formatters still need to be available on the system or installed through Mason.

## Notes

- The tracked wallpaper is `.config/hypr/wallpapers/archGrey.png`.
- Hypridle turns displays off after 30 minutes and restores them on input.
- Vicinae uses the custom square, opaque Tomorrow Night Bright theme with DejaVu Sans Mono.
- Kitty and the desktop share a black-and-teal Tomorrow-inspired palette.
