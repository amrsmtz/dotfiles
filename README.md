# My Dotfiles

This repository contains my personal configuration files (dotfiles) for the tools I use on macOS.

## Installation

```bash
git clone https://github.com/amrsmtz/dotfiles.git ~/dev/dotfiles
~/dev/dotfiles/install.sh
```

The script installs the missing Homebrew formulas and the MesloLGS NF font, installs Hammerspoon, then creates the symlinks below. Existing files are backed up with a `.bak.<date>` suffix, and running it again is safe. The iTerm2 profile still needs to be imported by hand.

## Contents

### .zshrc
Zsh configuration: history, completion, aliases, and lazy loading of nvm to keep shell startup fast. The prompt is provided by Starship.

Requirements:
* Homebrew: `starship`, `zsh-syntax-highlighting`, `rbenv`, and `openjdk`
* [nvm](https://github.com/nvm-sh/nvm), installed with its install script in `~/.nvm`

```bash
ln -s ~/dev/dotfiles/.zshrc ~/.zshrc
```

### .config/starship.toml
Starship prompt configuration, based on the [Tokyo Night preset](https://starship.rs/presets/tokyo-night) with a Ruby segment added and the prompt kept on a single line.

```bash
ln -s ~/dev/dotfiles/.config/starship.toml ~/.config/starship.toml
```

### .vimrc
Minimal configuration for the Vim that ships with macOS. In a truecolor terminal it uses `.vim/colors/github_dark_dimmed.vim`, a plugin-free colorscheme with the palette of VS Code's GitHub Dark Dimmed theme; elsewhere it falls back to the terminal's ANSI colors.

```bash
ln -s ~/dev/dotfiles/.vimrc ~/.vimrc
mkdir -p ~/.vim/colors
ln -s ~/dev/dotfiles/.vim/colors/github_dark_dimmed.vim ~/.vim/colors/github_dark_dimmed.vim
```

### .hammerspoon/init.lua
[Hammerspoon](https://www.hammerspoon.org) configuration: keyboard shortcuts to tile the focused window (`ctrl+alt` + arrows or return) and move it to the next or previous screen (`ctrl+alt+cmd` + left/right). Hammerspoon is installed by the script with Homebrew, and needs the Accessibility permission under System Settings > Privacy & Security > Accessibility.

```bash
ln -s ~/dev/dotfiles/.hammerspoon/init.lua ~/.hammerspoon/init.lua
```

### iterm2-profile.json
iTerm2 profile using the GitHub Dark colors. Import it in iTerm2 under Settings > Profiles > Other Actions > Import JSON Profiles.

### vsc-settings.json
VS Code user settings.

```bash
ln -s ~/dev/dotfiles/vsc-settings.json ~/Library/Application\ Support/Code/User/settings.json
```
