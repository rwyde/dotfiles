# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000

SAVEHIST=10000
setopt autocd extendedglob nomatch
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/rob/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit
# End of lines added by compinstall

# prompt walters

# Aliases

alias ls="ls --color=auto"
alias vim="nvim"
alias v="nvim"
alias grep="rg"
alias k="kubectl"
alias s="systemctl"
alias history='history 1 -1'
alias tf="terraform"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git pull"
alias gP="git push"
alias nr="npm run"
alias mpv="swallow mpv"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

eval "$(starship init zsh)"
unset npm_config_prefix
source /usr/share/nvm/init-nvm.sh

autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
