export EDITOR=/usr/bin/nano
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Dotnet exports
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools/
export PATH=$PATH:$HOME/.local/bin/

# Nvim exports
export PATH="$PATH:/opt/nvim/"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Ruby exports
# rbenv should be installed
export GEM_HOME=$HOME/.gem
export PATH=$HOME/.gem/bin:$PATH

# mise is a tool to manage versions of environments and languages such as node, ruby, python, etc.
# can be installed with `curl https://mise.run | sh`
eval "$(~/.local/bin/mise activate zsh)"
. "$HOME/.cargo/env"
