#!/usr/bin/env bash
# Activates the dotfiles on a new machine: installs the Homebrew dependencies
# and creates the symlinks. Safe to run again: correct links are left alone and
# existing files are backed up instead of being overwritten.
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Files and directories to symlink, relative to both the repo and $HOME
LINKS=(
  .zshrc
  .config/starship.toml
  .config/nvim
)

BREW_FORMULAS=(
  neovim
  openjdk
  rbenv
  starship
  zsh-syntax-highlighting
)

FONTS_DIR="$HOME/Library/Fonts"
FONT_STYLES=(Regular Bold Italic "Bold Italic")
FONT_URL="https://github.com/romkatv/powerlevel10k-media/raw/master"

info() { printf '\033[34m==>\033[0m %s\n' "$1"; }
warn() { printf '\033[33mWarning:\033[0m %s\n' "$1"; }

install_brew_formulas() {
  if ! command -v brew >/dev/null 2>&1; then
    warn "Homebrew is not installed, skipping formulas (see https://brew.sh)"
    return
  fi
  for formula in "${BREW_FORMULAS[@]}"; do
    if brew list --formula "$formula" >/dev/null 2>&1; then
      info "$formula already installed"
    else
      info "Installing $formula"
      brew install "$formula"
    fi
  done
}

# MesloLGS NF, the terminal font used by the iTerm2 profile
install_fonts() {
  mkdir -p "$FONTS_DIR"
  for style in "${FONT_STYLES[@]}"; do
    local file="MesloLGS NF $style.ttf"
    if [ -f "$FONTS_DIR/$file" ]; then
      info "$file already installed"
    else
      info "Installing $file"
      curl -fsSL "$FONT_URL/${file// /%20}" -o "$FONTS_DIR/$file"
    fi
  done
}

link() {
  local src="$DOTFILES_DIR/$1"
  local dst="$HOME/$1"

  if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
    info "$dst already linked"
    return
  fi

  mkdir -p "$(dirname "$dst")"
  if [ -e "$dst" ] || [ -L "$dst" ]; then
    local backup="$dst.bak.$(date +%Y%m%d%H%M%S)"
    warn "$dst exists, moved to $backup"
    mv "$dst" "$backup"
  fi
  ln -s "$src" "$dst"
  info "Linked $dst -> $src"
}

install_brew_formulas
install_fonts

for path in "${LINKS[@]}"; do
  link "$path"
done

if [ ! -s "$HOME/.nvm/nvm.sh" ]; then
  warn "nvm is not installed, see https://github.com/nvm-sh/nvm#installing-and-updating"
fi

cat <<EOF

Done. Remaining manual steps:
  * iTerm2: import iterm2-githubdark-profile.json under Settings > Profiles > Other Actions > Import JSON Profiles
  * VS Code: copy vsc-settings.json into ~/Library/Application Support/Code/User/settings.json
  * Open a new terminal to load the shell configuration
EOF
