# starship
eval "$(starship init zsh)"

# zsh config
alias zshconfig="nano ~/.zshrc"
alias starshipconfig="nano ~/.config/starship.toml"

# cat -> bat
alias ll='eza -al'
alias l='eza --sort=size -ral --total-size'
alias cat=bat
alias yolo1='git commit -m "$(curl -s https://whatthecommit.com/index.txt)"'

# cd aliases
alias ..="cd .."
alias ...="cd ../.."

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
