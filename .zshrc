# language
export LANG="en_US.UTF-8"

# autocompletions
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# atuin
eval "$(atuin init zsh)"

# databricks
fpath+=/opt/homebrew/share/zsh/site-functions

# fzf
source <(fzf --zsh)

# Add in snippets
autoload -Uz compinit && compinit

# History
HISTSIZE=2500
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# starship
eval "$(starship init zsh)"
alias starshipconfig="nano ~/.config/starship.toml"
SPACESHIP_PROMPT_ASYNC=FALSE

# ALIASES
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias ll='eza -al'
alias l='eza --sort=size -ral --total-size'
alias cat=bat
alias Downloads="cd ~/Downloads"
alias Projects="cd ~/Desktop/Projects"
alias ghosttyconfig="nano ~/.config/ghostty/config"
alias zshconfig="nano ~/.zshrc"
alias databricksconfig="nano ~/.databrickscfg"
alias tw="tw --theme catppuccin"        

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Reload the shell
alias reload="exec ${SHELL} -l"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# ps
alias pg='ps aux | grep -v grep | grep $1'

# timestamp
alias timestamp='date -u "+%s"'

# pdf -> jpg
ptj() {
  filename=$1
  trimmed_filename="${filename%%.*}"
  command="sips -s format jpeg $filename --out $trimmed_filename.jpg"
  echo $command
  $command
}

# lol
alias yolo1='git commit -m "$(curl -s https://whatthecommit.com/index.txt)"'

# java
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

# go
export PATH="/Users/mimadej/go/bin:$PATH"

# uv
. "$HOME/.cargo/env"

# direnv
eval "$(direnv hook zsh)"

# claude
alias claude="/Users/mimadej/.claude/local/claude"
