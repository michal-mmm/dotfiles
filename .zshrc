# cat -> bat
alias cat=bat

# cd aliases
alias ..="cd .."
alias ...="cd ../.."

# ps
alias pg='ps aux | grep -v grep | grep $1'

# timestamp
alias timestamp='date -j -f "%a %b %d %T %Z %Y" "`date`" "+%s"'

# pdf -> jpg
ptj() {
  filename=$1
  trimmed_filename="${filename%%.*}"
  command="sips -s format jpeg $filename --out $trimmed_filename.jpg"
  echo $command
  $command
}

# zsh plugins
plugins=(
        git
        zsh-autosuggestions
        sudo
        dotenv
        poetry
)
