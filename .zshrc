export SVN_EDITOR=vim
export GIT_EDITOR=vim

autoload -Uz promptinit
promptinit
prompt adam1 blue white blue

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt histignorealldups sharehistory

# auto change directory
setopt auto_cd
# command correct edition before each completion attempt
setopt correct
# no beep sound when complete list displayed
setopt nolistbeep

# historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end


# Use modern completion system
autoload -Uz compinit
compinit

# Alias configuration
setopt complete_aliases

case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
linux*)
    alias ls="ls --color"
    ;;
esac

alias la="ls -laG"
alias ll="ls -l"
alias du="du -h"
alias df="df -h"
alias vi="vim"
