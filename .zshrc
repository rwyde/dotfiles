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

# fzf
source <(fzf --zsh)

# Aliases

alias ls="ls --color=auto"
alias ll="ls -l --color=auto"
alias vim="nvim"
alias v="nvim"
alias grep="rg"
alias rgf="rg --files | rg"
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
alias orphans="yay -Qdtq | yay -Rns -"
alias opencode='OPENCODE_SERVER_USERNAME=opencode OPENCODE_SERVER_PASSWORD="$(< "$HOME/.config/opencode/server-password")" command opencode attach http://127.0.0.1:4096'
alias oc='opencode'
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias music="rmpc"
alias p="pnpm"
alias si='pnpm --dir /home/rob/src/si-platform/main exec tsx packages/cli/src/index.ts'
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

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
compdef dots=git

autoload -Uz compinit && compinit

# Window title
# preexec() { print -Pn "\e]0;$1%~\a" }
# fpath+=("$HOME/.zsh/functions")

export PATH="$HOME/.cargo/bin:${KREW_ROOT:-$HOME/.krew}/bin:$HOME/go/bin:$PATH"

# Pi
export PATH="/home/rob/.pi/agent/bin:$PATH"
