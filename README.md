# My Dotfiles

This repository contains my personal configuration files (dotfiles) for the tools I use on macOS.

## Installation

```bash
git clone https://github.com/amrsmtz/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
```

The script installs the missing Homebrew formulas and the MesloLGS NF font, then creates the symlinks below. Existing files are backed up with a `.bak.<date>` suffix, and running it again is safe. The iTerm2 profile still needs to be imported by hand.

## Contents

### .zshrc
Zsh configuration: history, completion, aliases, and lazy loading of nvm to keep shell startup fast. The prompt is provided by Starship.

Requirements:
* Homebrew: `starship`, `zsh-syntax-highlighting`, `rbenv`, `openjdk`, and `neovim`
* [nvm](https://github.com/nvm-sh/nvm), installed with its install script in `~/.nvm`

```bash
ln -s ~/dotfiles/.zshrc ~/.zshrc
```

### .config/starship.toml
Starship prompt configuration (single line prompt).

```bash
ln -s ~/dotfiles/.config/starship.toml ~/.config/starship.toml
```

### .config/nvim
Neovim configuration, based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim). Plugins are managed by lazy.nvim and pinned in `lazy-lock.json`.

```bash
ln -s ~/dotfiles/.config/nvim ~/.config/nvim
```

### iterm2-githubdark-profile.json
iTerm2 profile using the GitHub Dark colors. Import it in iTerm2 under Settings > Profiles > Other Actions > Import JSON Profiles.

### vsc-settings.json
VS Code user settings.

```bash
ln -s ~/dotfiles/vsc-settings.json ~/Library/Application\ Support/Code/User/settings.json
```
