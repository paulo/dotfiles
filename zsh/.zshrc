#!/bin/bash

############################################
#          Main zsh configuration
############################################

# Uncomment to profile configuration
# TODO: Set by env var
# zmodload zsh/zprof

export ZSH_DEPS_HOME=$HOME/.zsh_deps

# Base exports
. $ZSH_DEPS_HOME/base_exports

# Asdf version manager
. $ZSH_DEPS_HOME/asdf

# Source zgenom
. $ZSH_DEPS_HOME/z_genom

# Command alias
. $ZSH_DEPS_HOME/alias

# Work exclusive configuration
[ -f $ZSH_DEPS_HOME/private/work ] && source $ZSH_DEPS_HOME/private/work
[ -f $ZSH_DEPS_HOME/private/work ] && source $ZSH_DEPS_HOME/private/secrets

# Fzf key bindings and fuzzy completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Custom commands at the end to avoid override by other plugins
for f in $ZSH_DEPS_HOME/custom_comms/*; do source $f; done

# Syntax highlighting configs
# https://blog.patshead.com/2012/01/using-and-customizing-zsh-syntax-highlighting-with-oh-my-zsh.html
# Stop underlining ceritain commands and paths
export ZSH_HIGHLIGHT_STYLES[precommand]=none
export ZSH_HIGHLIGHT_STYLES[path]=none

# Init pyenv and virtual-env
# TODO: Init by env var
eval "$(pyenv init - --no-rehash)"
eval "$(pyenv virtualenv-init -)"

# Init zoxide (https://github.com/ajeetdsouza/zoxide)
eval "$(zoxide init zsh)"

#if not inside a tmux session, and if no session is started, start a new session
if which tmux >/dev/null 2>&1; then
  test -z "$TMUX" && (tmux attach -t default || tmux new -s default)
fi

# Hook direnv silently so it reads .envrc on directory change - https://direnv.net/
eval "$(direnv hook zsh)" 2>&1

# Uncomment for profile configuration
# TODO: Set by env var
# zprof

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
