# SYSTEM VARS
export DEV_DIR=$HOME/GitHub

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
 source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Oh My ZSH settings
export ZSH="$HOME/.oh-my-zsh"
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

source ~/.powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Personal executables
export PATH="$PATH:$HOME/bin"

# CMDSTAN path
CMDSTAN_PATH=$(Rscript -e 'cat(try(cmdstanr::cmdstan_path(), silent=TRUE))' 2>/dev/null)
if [ ! -z "$CMDSTAN_PATH" ] && [ -d "$CMDSTAN_PATH" ]; then
    export PATH="$CMDSTAN_PATH/bin:$PATH"
fi


# Colorize man pages with bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

# export environmental variables
export LC_ALL=en_US.UTF-8
export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"


# custom programs/aliases
alias l='ls -lAh'
alias R='R --no-save'
alias r="radian"
alias python="python3"
alias qp="quarto preview --render all"
alias update_website="quarto publish gh-pages --no-prompt --no-render --no-browser"
alias create_temp_dir='temp_dir=$(mktemp -d) && cd $temp_dir'
alias gs='git status'
alias vim='nvim'


destroy_github_repo() {
  local proj="$1"
  
  # Check if the folder exists
  if [[ ! -d "$proj" ]]; then
    echo "Directory $proj does not exist."
    return 1
  fi
  
  # Check if the folder is a git repository
  if [[ ! -d "$proj/.git" ]]; then
    echo "Directory $proj is not a git repository."
    return 1
  fi
  
  # Check if there is a remote repository
  cd "$proj" || return 1
  local remote_url
  remote_url=$(git remote get-url upstream)
  
  if [[ -z "$remote_url" ]]; then
    echo "No remote repository found for $proj."
    return 1
  fi

  Rscript -e "renv::deactivate(clean = TRUE)"
  
  # Delete the local folder and the remote repository
  cd ..
  rm -fr "$proj" && gh repo delete "$remote_url" --yes
}


# Lazy git
function lgit() {
  git add .
  git commit -a -m "$1"
  git push
}

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

