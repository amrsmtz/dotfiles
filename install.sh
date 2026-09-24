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

for path in "${LINKS[@]}"; do
  link "$path"
done

if [ ! -s "$HOME/.nvm/nvm.sh" ]; then
  warn "nvm is not installed, see https://github.com/nvm-sh/nvm#installing-and-updating"
fi
if [ ! -d /opt/homebrew/opt/openssl@1.1 ]; then
  warn "openssl@1.1 is missing (disabled in Homebrew), only needed to compile Ruby 3.0 and older"
fi

cat <<EOF

Done. Remaining manual steps:
  * iTerm2: import iterm2-githubdark-profile.json under Settings > Profiles > Other Actions > Import JSON Profiles
  * VS Code: copy vsc-settings.json into ~/Library/Application Support/Code/User/settings.json
  * Open a new terminal to load the shell configuration
EOF
