# Personal Dotfiles

A highly polished, production-ready dotfiles repository featuring unified Catppuccin Mocha theming, dual environment support (X11/Wayland), and modern development tooling.

## Philosophy

These dotfiles prioritize:
- **Keyboard-driven workflows** with vim-style navigation everywhere
- **Unified aesthetics** via Catppuccin Mocha theme across all applications
- **Developer productivity** with LSP, testing, AI assistants, and smart tooling
- **Seamless integration** between Neovim, Tmux, and terminal emulators
- **Dual environment support** for both X11 (i3) and Wayland (Hyprland)

## Quick Start

```bash
# Clone repository
cd ~
git clone git@github.com:profemzy/dotfiles.git

# Install dependencies (Arch Linux)
sudo pacman -S stow neovim tmux zsh starship fzf zoxide

# Apply configurations using stow
cd dotfiles
stow nvim tmux zshrc starship ghostty

# For Hyprland (Wayland)
stow hyprland hyprlock hyprpaper waybar wofi

# For i3 (X11)
stow i3 polybar rofi picom xresources
```

After applying configurations:
1. Change shell to Zsh: `chsh -s $(which zsh)`
2. Log out and back in
3. Open Neovim to auto-install plugins: `nvim`
4. Install Tmux plugins: `Ctrl+s I` (prefix + I)


## Table of Contents

- [Neovim](#neovim)
- [Terminal Emulators](#terminal-emulators)
- [Shell Environment](#shell-environment)
- [Tmux](#tmux)
- [Window Managers](#window-managers)
  - [Hyprland (Wayland)](#hyprland-wayland)
  - [i3 (X11)](#i3-x11)
- [Status Bars](#status-bars)
- [Application Launchers](#application-launchers)
- [Theme](#theme)
- [Dependencies](#dependencies)

---

## Neovim

**Location:** `nvim/.config/nvim/`

A modern Neovim configuration optimized for Ruby/Rails development with LSP, AI assistants, and extensive plugin integration.

### Plugin Manager
- **Lazy.nvim** - Fast, lazy-loading plugin manager

### Core Settings
- **Leader key:** Space
- **Indentation:** 2 spaces (expandtab)
- **Line numbers:** Enabled
- **Swapfile:** Disabled
- **Clipboard:** System clipboard integration

### Key Plugins

#### Theme
- **catppuccin/nvim** - Catppuccin Mocha with transparent background

#### LSP & Completions
- **mason.nvim** - LSP/DAP/linter installer
- **nvim-lspconfig** - LSP configurations
- **nvim-cmp** - Completion engine
- **LuaSnip** - Snippet engine
- **LSP Servers:** tailwindcss, ruby_lsp, lua_ls

#### AI Assistants
- **avante.nvim** - Claude AI coding assistant with image support
- **copilot.vim** - GitHub Copilot integration

#### File Management
- **oil.nvim** - File explorer as editable buffer (toggle with `-`)
- **snacks.nvim** - Multi-purpose suite by Folke
  - File picker (`Ctrl+p`)
  - Recent files (`<leader><leader>`)
  - Grep (`<leader>fg`)
  - Explorer (`Ctrl+n`)
  - Lazygit integration (`<leader>lg`)
  - Dashboard, scratch buffers, notifications

#### Testing
- **vim-test** - Test runner with vimux integration
- Tests run in tmux split pane

#### Navigation
- **vim-tmux-navigator** - Seamless Neovim/Tmux navigation with `Ctrl+hjkl`

#### Syntax
- **nvim-treesitter** - Advanced syntax highlighting
- **Languages:** bash, ruby, html, css, scss, javascript, typescript, json, lua

### Essential Keybindings

**General:**
- `Space` - Leader key
- `Ctrl+h/j/k/l` - Window navigation (works across Neovim & Tmux)
- `<leader>h` - Clear search highlight

**LSP:**
- `K` - Hover documentation
- `<leader>gd` - Go to definition
- `<leader>gr` - Go to references
- `<leader>ca` - Code actions
- `<leader>gf` - Format file
- `<space>rn` - Rename symbol

**File Management:**
- `Ctrl+p` - Find files (fuzzy finder)
- `<leader><leader>` - Recent files
- `<leader>fb` - Browse buffers
- `<leader>fg` - Grep in files
- `Ctrl+n` - File explorer
- `-` - Oil.nvim file browser

**Git:**
- `<leader>lg` - Lazygit
- `<leader>gl` - Lazygit log

**Testing:**
- `<leader>t` - Run nearest test
- `<leader>T` - Run test file
- `<leader>a` - Run test suite
- `<leader>l` - Run last test
- `<leader>g` - Visit last test

**Completion:**
- `Ctrl+Space` - Trigger completion
- `Enter` - Confirm selection
- `Ctrl+e` - Abort

---

## Terminal Emulators

### Ghostty (Primary)

**Location:** `ghostty/.config/ghostty/config`

Modern, GPU-accelerated terminal emulator.

**Configuration:**
- **Theme:** Imports from `~/.config/omarchy/current/theme/ghostty.conf`
- **Font size:** 14
- **Font:** CaskaydiaCove Nerd Font (preferred)
- **Background opacity:** 0.95 (semi-transparent)
- **GTK titlebar:** Disabled
- **Mouse scroll:** 0.95 multiplier

**Integration:** Auto-syncs with omarchy theme system

### Alacritty

**Location:** `alacritty/.config/alacritty/`

**Configuration:**
- **Theme:** Catppuccin Mocha
- **Font:** CaskaydiaCove Nerd Font, size 14
- **TERM:** xterm-256color

### Kitty

**Location:** `kitty/.config/kitty/`

**Configuration:**
- **Theme:** Catppuccin Mocha
- **Font:** CaskaydiaCove Nerd Font Mono, size 14

---

## Shell Environment

### Zsh

**Location:** `zshrc/.zshrc`

Modern shell configuration with smart integrations.

**Environment Variables:**
- `EDITOR=nvim`
- `SUDO_EDITOR=nvim`
- `PGHOST=/var/run/postgresql`

**History:**
- File: `~/.history`
- Size: 10,000 commands in memory
- Save: 50,000 commands on disk
- Incremental append enabled

**Integrations:**
- **Starship** - Prompt
- **Zoxide** - Smart directory jumping (`z`)
- **fzf** - Fuzzy finder with keybindings
- **mise** - Version manager (replaces asdf)

**Custom Functions:**

**`new_tmux` / `tm`** - Smart tmux session manager
```bash
tm  # Opens zoxide + fzf picker, creates/attaches tmux session
```
Functionality:
1. Uses zoxide to select directory with fzf
2. Creates tmux session named after directory
3. Automatically attaches or switches to session
4. Works both inside and outside tmux
5. Sends desktop notifications

**Aliases:**
- `tm` - Shortcut for new_tmux
- `zed` - Alias for zeditor

### Starship Prompt

**Location:** `starship/.config/starship.toml`

Powerline-style prompt with Catppuccin Mocha theme.

**Features:**
- OS icon
- Username
- Directory (truncated to 3 levels)
- Git branch & status
- Language versions (Node.js, Ruby, Python, Go, etc.)
- Docker context
- Time (HH:MM)
- Status-aware character (green/red arrow)

**Directory Icons:**
- Documents: 󰈙
- Downloads: 
- Music: 󰝚
- Pictures: 
- Developer: 󰲋

**Color Schemes:**
- **Active:** Catppuccin Mocha
- **Available:** Gruvbox Dark

---

## Tmux

**Location:** `tmux/.tmux.conf`

Terminal multiplexer configured for seamless Neovim integration.

### Core Settings
- **Prefix:** `Ctrl+s` (instead of Ctrl+b)
- **Mouse:** Enabled
- **Vi mode:** Enabled for copy mode
- **Status bar:** Top position with transparent Catppuccin theme
- **Colors:** tmux-256color with RGB support

### Keybindings
- **Reload config:** `Prefix+r`
- **Pane navigation:** `Prefix+hjkl` (vim-style)
- **Integration:** Works with vim-tmux-navigator for seamless vim/tmux navigation

### Plugins (TPM)
1. **tpm** - Tmux Plugin Manager
2. **vim-tmux-navigator** - Seamless vim/tmux pane navigation
3. **catppuccin/tmux** - Catppuccin Mocha theme (v2.1.0)

**Theme Features:**
- Rounded window status style
- Transparent background
- Shows application and session name

**Install plugins:** `Prefix + I`


## Window Managers

### Hyprland (Wayland)

**Location:** `hyprland/.config/hypr/`

Modern Wayland compositor with animations and custom keybindings.

#### Theme & Appearance
- **Color scheme:** Catppuccin Mocha (`mocha.conf`)
- **Cursor:** catppuccin-mocha-dark-cursors, size 28
- **Borders:** 3px, mauve-to-flamingo gradient (active)
- **Gaps:** 4px inner, 8px outer
- **Rounding:** 4px
- **Blur:** Enabled (size 3, 1 pass)
- **Drop shadow:** Enabled

#### Monitor Configuration
- **Default scale:** 1.6
- **eDP-1:** 1.6 scale, preferred resolution

#### Input
- **Keyboard:** US layout
- **Caps Lock:** Remapped to Ctrl (`kb_options = ctrl:nocaps`)
- **Touchpad:** Natural scroll enabled

#### Animations
- Custom bezier curves
- Fast transitions (0.1s - 0.5s)
- Rotating gradient border animation

#### Autostart
- Cursor theme, polkit, waybar, swaync, hyprpaper, hypridle

#### Key Bindings

**Applications:**
- `Super+Return` - Ghostty terminal
- `Super+Space` - Wofi launcher

**Window Management:**
- `Super+C` - Kill window
- `Super+M` - Exit Hyprland
- `Super+V` - Toggle floating
- `Super+F` - Fullscreen
- `Super+hjkl` - Move focus (vim-style)
- `Super+Shift+hjkl` - Move window

**Workspaces:**
- `Super+[0-9]` - Switch workspace
- `Super+Shift+[0-9]` - Move window to workspace
- `Super+S` - Toggle scratchpad
- `Super+MouseScroll` - Cycle workspaces

**System:**
- `Print` - Screenshot window
- `Shift+Print` - Screenshot region
- `Super+Shift+L` - Lock screen (hyprlock)
- `Super+Shift+R` - Reload config
- `Super+Shift+D/F` - Disable/Enable eDP-1 monitor
- `XF86AudioRaiseVolume/Lower` - Volume control
- `XF86MonBrightnessUp/Down` - Brightness control

#### Related Configs

**Hypridle** (`hyprland/.config/hypr/hypridle.conf`)
Idle management with progressive timeouts:
- 5 min: Dim to 10%
- 5.5 min: Lock
- 5.8 min: Display off
- 30 min: Suspend (optional)

**Hyprlock** (`hyprlock/.config/hypr/hyprlock.conf`)
Lock screen with:
- Blurred wallpaper
- Large time display (90pt)
- User avatar
- Catppuccin Mocha themed input field

**Hyprpaper** (`hyprpaper/.config/hypr/hyprpaper.conf`)
- Wallpaper: `~/.config/backgrounds/shaded.png`

### i3 (X11)

**Location:** `i3/.config/i3/config`

Tiling window manager for X11 with Catppuccin theme.

#### Core Settings
- **Mod key:** Super (Mod4)
- **Borders:** 1px
- **Font:** MesloLGS Nerd Font Mono Bold 14

#### Autostart
- picom (compositor)
- feh (wallpaper)
- polybar (status bar)
- xrdb (Xresources)
- setxkbmap (Caps Lock to Ctrl)
- nm-applet, xss-lock

#### Key Bindings

**Applications:**
- `Super+Return` - Alacritty
- `Super+d` - Rofi drun mode
- `Super+Space` - Rofi combi mode
- `Super+Tab` - Rofi window switcher

**Window Management:**
- `Super+Shift+q` - Kill window
- `Super+hjkl` - Focus (vim-style)
- `Super+Shift+hjkl` - Move window
- `Super+f` - Fullscreen
- `Super+s/w/e` - Stacking/Tabbed/Split layout

**Workspaces:**
- `Super+[1-0]` - Switch workspace
- `Super+Shift+[1-0]` - Move to workspace

**Screenshots (maim):**
- `Print` - Full screen
- `Super+Print` - Active window
- `Shift+Print` - Selection
- Add `Ctrl` - Copy to clipboard

**System:**
- Volume: XF86 keys with pactl
- Brightness: XF86 keys with brightnessctl

#### Theme
Complete Catppuccin Mocha color definitions for borders and bars.

---

## Status Bars

### Waybar (Wayland)

**Location:** `waybar/.config/waybar/`

Status bar for Hyprland with Catppuccin theming.

**Modules:**
- **Left:** Workspaces
- **Center:** Window title
- **Right:** Network, PulseAudio, Battery, Clock

**Features:**
- Network status (WiFi ESSID)
- Volume control (click for pavucontrol)
- Battery with charging states (warning: 30%, critical: 15%)
- Clock with calendar tooltip

**Styling:**
- Font: MesloLGS Nerd Font Mono Bold, 16px
- Transparent background
- Color-coded modules (maroon, blue, yellow, green)

### Polybar (X11)

**Location:** `polybar/.config/polybar/`

Status bar for i3 with Catppuccin theme.

**Modules:**
- **Left:** Workspaces, Window title
- **Right:** PulseAudio, Battery, Memory, CPU, WLAN, Date

**Features:**
- Animated battery charging icons
- Color-coded resource usage
- WLAN ESSID display
- Multi-monitor support

**Launch Script:** `launch_polybar.sh` - Automatically launches on all monitors

---

## Application Launchers

### Wofi (Wayland)

**Location:** `wofi/.config/wofi/style.css`

Application launcher for Hyprland.

**Styling:**
- Catppuccin Mocha theme
- Font: CaskaydiaCove Nerd Font, 18px
- 2px lavender border with 8px radius
- Selected entries highlighted in mauve

### Rofi (X11)

**Location:** `rofi/.config/rofi/`

Application launcher for i3.

**Features:**
- Catppuccin Mocha theme
- Icons enabled (Oranchelo theme)
- Modi: run, window, combi
- Sidebar mode
- Terminal: alacritty

---

## Theme

### Catppuccin Mocha

Unified theme across all applications with consistent color palette:

**Key Colors:**
- Rosewater: `#f5e0dc`
- Flamingo: `#f2cdcd`
- Pink: `#f5c2e7`
- Mauve: `#cba6f7`
- Red: `#f38ba8`
- Maroon: `#eba0ac`
- Peach: `#fab387`
- Yellow: `#f9e2af`
- Green: `#a6e3a1`
- Teal: `#94e2d5`
- Sky: `#89dceb`
- Sapphire: `#74c7ec`
- Blue: `#89b4fa`
- Lavender: `#b4befe`

**Background Shades:**
- Base: `#1e1e2e`
- Mantle: `#181825`
- Crust: `#11111b`

**Text Shades:**
- Text: `#cdd6f4`
- Subtext1: `#bac2de`
- Subtext0: `#a6adc8`

### Font Consistency

**Primary Fonts:**
- **CaskaydiaCove Nerd Font** - Terminals, Wofi
- **MesloLGS Nerd Font Mono** - i3, Polybar, Waybar
- **JetBrainsMono Nerd Font** - Hyprlock

All fonts support Nerd Font icons for consistent iconography.

### Wallpapers

**Location:** `backgrounds/.config/backgrounds/`

7 curated wallpapers (26MB total):
- **shaded.png** (2.5MB) - Used by Hyprland/Hyprlock
- **nice-blue-background.png** (7.4MB) - Used by i3
- **lofiwallpaper.png** (2.2MB)
- **car-with-full-moon-background.jpg** (8.6MB)
- **better_shaded_landscape.jpg** (865KB)
- **shaded_landscape.png** (4.0MB)
- **arch-rainbow.png** (25KB)


## Dependencies

### Required Packages

**Core:**
```bash
sudo pacman -S stow git neovim tmux zsh
```

**Shell Tools:**
```bash
sudo pacman -S starship fzf zoxide ripgrep fd bat eza
```

**Hyprland (Wayland):**
```bash
sudo pacman -S hyprland hyprpaper hypridle hyprlock waybar wofi
sudo pacman -S polkit-gnome swaync brightnessctl
yay -S hyprshot
```

**i3 (X11):**
```bash
sudo pacman -S i3-wm polybar rofi picom feh
sudo pacman -S maim xdotool xclip
sudo pacman -S brightnessctl pactl
```

**Terminal Emulators:**
```bash
yay -S ghostty
sudo pacman -S alacritty kitty
```

**Fonts:**
```bash
yay -S ttf-cascadia-code-nerd
yay -S ttf-meslo-nerd-font-powerlevel10k
yay -S ttf-jetbrains-mono-nerd
```

**Version Manager:**
```bash
curl https://mise.run | sh
```

**Additional CLI Tools:**
```bash
sudo pacman -S lazygit notify-send
```

### Neovim Dependencies

**LSP Servers** (auto-installed by Mason):
- tailwindcss
- ruby_lsp
- lua_ls

**External Tools:**
```bash
npm install -g swagger-ui-watcher  # For swagger-preview.nvim
```

### Tmux Plugin Manager

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Then in tmux: `Prefix + I` to install plugins

---

## Deployment with Stow

This repository uses GNU Stow for symlink management. Each top-level directory is a stow package.

### Basic Usage

```bash
cd ~/dotfiles

# Install individual packages
stow nvim        # Links nvim/.config/nvim -> ~/.config/nvim
stow tmux        # Links tmux/.tmux.conf -> ~/.tmux.conf
stow zshrc       # Links zshrc/.zshrc -> ~/.zshrc

# Install multiple packages
stow nvim tmux zshrc starship ghostty

# For Hyprland setup
stow hyprland hyprlock hyprpaper waybar wofi

# For i3 setup
stow i3 polybar rofi picom xresources
```

### Removing Configurations

```bash
stow -D nvim     # Removes nvim symlinks
```

### Restowing (update links)

```bash
stow -R nvim     # Removes and re-creates links
```

---

## Structure

```
dotfiles/
├── nvim/              # Neovim config (Lazy.nvim, LSP, AI assistants)
├── tmux/              # Tmux config (TPM, Catppuccin theme)
├── zshrc/             # Zsh shell config (starship, zoxide, fzf)
├── starship/          # Starship prompt (Catppuccin theme)
├── ghostty/           # Ghostty terminal (omarchy theme integration)
├── alacritty/         # Alacritty terminal
├── kitty/             # Kitty terminal
├── hyprland/          # Hyprland compositor + hypridle
├── hyprlock/          # Hyprland lock screen
├── hyprpaper/         # Hyprland wallpaper
├── hyprmocha/         # Catppuccin Mocha colors for Hyprland
├── waybar/            # Waybar status bar (Wayland)
├── wofi/              # Wofi launcher (Wayland)
├── i3/                # i3 window manager (X11)
├── polybar/           # Polybar status bar (X11)
├── rofi/              # Rofi launcher (X11)
├── picom/             # Picom compositor (X11)
├── xresources/        # X resources
├── backgrounds/       # Wallpapers
└── screenlayout/      # Monitor layouts (xrandr scripts)
```

---

## Integration Points

### Seamless Navigation
- **vim-tmux-navigator:** `Ctrl+hjkl` works across Neovim and Tmux panes
- **Consistent keybindings:** Same hjkl navigation in i3 and Hyprland

### Theme Synchronization
- **Omarchy integration:** Ghostty auto-syncs with system theme
- **Unified Catppuccin:** Same color palette across all applications

### Smart Session Management
- **new_tmux/tm function:** Zoxide + fzf picker creates/attaches tmux sessions
- **Desktop notifications:** Session switching sends notifications

### Testing Workflow
- **vim-test + vimux:** Tests run in tmux split, visible alongside code
- **Persistent sessions:** Tmux preserves test output across Neovim restarts

### Version Management
- **mise integration:** Automatic version switching per directory
- **LSP coordination:** LSP servers use mise-managed language versions

---

## Customization

### Changing Theme Colors

**Neovim:**
Edit `nvim/.config/nvim/lua/plugins/catppuccin.lua`

**Starship:**
Edit `starship/.config/starship.toml` - Change `palette = "catppuccin_mocha"` to `palette = "gruvbox_dark"` or define custom colors

**Hyprland:**
Edit `hyprland/.config/hypr/mocha.conf` or source different color file

**Tmux:**
Edit `tmux/.tmux.conf` - Change catppuccin flavor or use different theme plugin

### Changing Fonts

Update font references in:
- Terminal configs: `ghostty/`, `alacritty/`, `kitty/`
- Status bars: `waybar/`, `polybar/`
- Window managers: `hyprland/`, `i3/`

### Adding Neovim Plugins

Create new file in `nvim/.config/nvim/lua/plugins/`:

```lua
return {
  "username/plugin-name",
  config = function()
    -- Plugin configuration
  end
}
```

Lazy.nvim auto-loads all files in the plugins directory.

### Modifying Keybindings

**Neovim:** `nvim/.config/nvim/lua/vim-options.lua`
**Tmux:** `tmux/.tmux.conf`
**Hyprland:** `hyprland/.config/hypr/hyprland.conf`
**i3:** `i3/.config/i3/config`

---

## Troubleshooting

### Tmux plugins not loading
```bash
# Install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# In tmux session
Ctrl+s I  # Prefix + I to install plugins
```

### Neovim plugins not installing
```bash
# Open Neovim
nvim

# Run Lazy commands
:Lazy sync
:Mason  # Check LSP server status
```

### Starship prompt not showing
```bash
# Ensure starship is installed
starship --version

# Check .zshrc sources starship
grep "starship init" ~/.zshrc
```

### Hyprland not starting
```bash
# Check logs
cat ~/.config/hypr/hyprland.log

# Verify dependencies
which waybar wofi hyprpaper
```

### Font icons not displaying
Install Nerd Fonts:
```bash
yay -S ttf-cascadia-code-nerd ttf-meslo-nerd-font-powerlevel10k
fc-cache -fv  # Rebuild font cache
```

---

## Maintenance

### Updating Neovim Plugins
```bash
nvim
:Lazy update
:Mason update
```

### Updating Tmux Plugins
In tmux: `Prefix + U`

### Updating Dotfiles
```bash
cd ~/dotfiles
git pull
stow -R <package>  # Restow to update symlinks
```

---

## Key Features Summary

### Unified Theming
- **Catppuccin Mocha** consistently applied across all applications
- Seamless visual experience from terminal to window manager

### Dual Environment Support
- **Wayland (Hyprland):** Modern compositor with animations
- **X11 (i3):** Stable tiling window manager
- Consistent keybindings across both environments

### Developer Productivity
- **LSP Integration:** Full language server support for Ruby, JavaScript/TypeScript, Lua
- **AI Assistants:** Avante.nvim (Claude) and GitHub Copilot
- **Testing:** Integrated test runner with tmux split view
- **Version Management:** mise for automatic tool version switching

### Workflow Optimization
- **Seamless Navigation:** Ctrl+hjkl works across Neovim and Tmux
- **Smart Sessions:** tm command for quick tmux session creation
- **Fuzzy Finding:** fzf integration in shell and Neovim
- **Git Integration:** Lazygit accessible from Neovim

### Modern Tooling
- **Lazy.nvim:** Fast plugin manager with lazy loading
- **Snacks.nvim:** Unified plugin suite for common tasks
- **Starship:** Fast, customizable prompt
- **Zoxide:** Smart directory jumping

---

## Credits

- **Theme:** [Catppuccin](https://github.com/catppuccin/catppuccin) - Soothing pastel theme
- **Plugin Manager:** [Lazy.nvim](https://github.com/folke/lazy.nvim) by folke
- **Snacks.nvim:** [snacks.nvim](https://github.com/folke/snacks.nvim) by folke
- **AI Assistant:** [Avante.nvim](https://github.com/yetone/avante.nvim)
- **Compositor:** [Hyprland](https://hyprland.org)
- **Prompt:** [Starship](https://starship.rs)
- **Navigation:** [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)

---

## License

This is a personal configuration repository. Feel free to fork and adapt for your own use!

---

**Last Updated:** 2025-11-21
