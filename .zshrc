export PATH="/opt/homebrew/sbin:/usr/local/bin:/opt/homebrew/bin:$PATH"

# Shell settings (formerly provided by oh-my-zsh)

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands in history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion before running it
setopt share_history          # share history between sessions

# Directories
setopt auto_cd                # type a directory name to cd into it
setopt auto_pushd             # cd pushes the old directory onto the stack
setopt pushd_ignore_dups
setopt pushdminus

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*' # case-insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Key bindings: up/down arrows search history by typed prefix
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey '^[OA' up-line-or-beginning-search
bindkey '^[OB' down-line-or-beginning-search

# Colors for ls
export CLICOLOR=1

# Git aliases (from the oh-my-zsh git plugin)
alias gb="git branch"
alias gbd="git branch --delete"
alias gbD="git branch --delete --force"
alias gcb="git checkout -b"
alias gcmsg="git commit --message"
alias gco="git checkout"
alias ggpull='git pull origin "$(git branch --show-current)"'
alias ggpush='git push origin "$(git branch --show-current)"'
alias gm="git merge"
alias gms="git merge --squash"
alias gpf!="git push --force"

# Rails / rake wrappers (from the oh-my-zsh rails plugin): prefer the project binstubs
_rails_wrapper() {
  if [ -e "bin/rails" ]; then
    bin/rails "$@"
  else
    command rails "$@"
  fi
}
_rake_wrapper() {
  if [ -e "bin/rake" ]; then
    bin/rake "$@"
  elif [ -e "Gemfile" ]; then
    bundle exec rake "$@"
  else
    command rake "$@"
  fi
}
alias rails="_rails_wrapper"
alias rake="_rake_wrapper"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
  export VISUAL='nvim'
fi

# Aliases
alias c="rails c"
alias cap="bundle exec cap"
alias formulaires="cd ~/dev/formulaires"
alias kamal="bundle exec kamal"
alias ll="ls -lah"
alias ludoludo="cd ~/dev/ludoludo"
alias nvimrc="nvim ~/.config/nvim/init.lua"
alias rspec="bundle exec rspec"
alias synbad="cd ~/dev/synbad"
alias vim="nvim"
alias zshrc="vim ~/.zshrc"
alias zshsource="source ~/.zshrc"

# Activate syntax highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Ruby / rbenv
eval "$(rbenv init - -zsh)"

# Node / nvm
export NVM_DIR="$HOME/.nvm"
# Loading nvm.sh costs ~0.7s: put the default Node version on PATH directly,
# and only load nvm itself the first time the `nvm` command is used
if [ -s "$NVM_DIR/alias/default" ]; then
  _nvm_default=("$NVM_DIR"/versions/node/v${$(<"$NVM_DIR/alias/default")#v}*(N/nOn[1]))
  [ -n "$_nvm_default" ] && export PATH="$_nvm_default/bin:$PATH"
  unset _nvm_default
fi
nvm() {
  unfunction nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  nvm "$@"
}

# Java / OpenJDK
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

# Local bin
export PATH="$HOME/.local/bin:$PATH"

# Prompt
eval "$(starship init zsh)"
