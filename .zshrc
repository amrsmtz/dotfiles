export PATH=$HOME/bin:/opt/homebrew/sbin:/usr/local/bin:/opt/homebrew/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"
#ZSH_THEME="fwalch"
DEFAULT_USER="aschmitz"

# Add wisely, as too many plugins slow down shell startup.
plugins=(rails git ruby lighthouse web-search)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
  export VISUAL='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.


# Aliases
alias c="rails c"
alias esearch="cd Applications/elasticsearch-7.17.16/bin && elasticsearch -d"
alias formulaires="cd ~/dev/formulaires"
alias ip="curl ipinfo.io/ip"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias ll="ls -lah"
alias ludoludo="cd ~/dev/ludoludo"
alias nvimrc="nvim ~/.config/nvim/init.lua"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias serve='ruby -run -e httpd . -p 8000' # Quickly serve the current directory as HTTP
alias synbad="cd ~/dev/synbad"
alias vim="nvim"
alias zshrc="vim ~/.zshrc"
alias zshsource="source ~/.zshrc"

# Functions

rmine() {
    if [ -z "$1" ]; then
        # No argument provided, use current git repo
        local repo_path=$(git rev-parse --show-toplevel 2>/dev/null)
        if [ -n "$repo_path" ]; then
            open -a /Applications/RubyMine.app "$repo_path"
        else
            echo "Not in a Git repository and no path provided."
        fi
    else
        # Argument provided, use it as the path
        if [ -d "$1" ]; then
            open -a /Applications/RubyMine.app "$1"
        else
            echo "The provided path is not a directory."
        fi
    fi
}

# Set the PKG_CONFIG_PATH environment variable to use the older OpenSSL versio
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

# Activate syntax highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH=/opt/homebrew/bin:$PATH

# For Ruby 2.x - 3.0
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
# ************* OR **************
# For Ruby 3.1 and above
#export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@3)"
eval "$(rbenv init - -zsh)"

# config for elasticsearch


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

export ES_HOME=~/Applications/elasticsearch-7.17.16
export ES_JAVA_HOME=~/Applications/elasticsearch-7.17.16/jdk.app/Contents/Home
export PATH=$ES_HOME/bin:$ES_JAVA_HOME/bin:$PATH

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
