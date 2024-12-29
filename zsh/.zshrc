# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



# Oh My ZSH settings
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh



# Created by `pipx` on 2024-12-25 15:32:11
# export PATH="$PATH:$HOME/.local/bin"


# export environmental variables
export LC_ALL=en_US.UTF-8


# custom programs/aliases
alias l='ls -lAh'
alias R='R --no-save'
alias r="radian"
alias qp="quarto preview --render all"
alias update_website="rsync -avz --progress --delete --chmod=Du=rwx,Dgo=rx,Fu=rw,Fgo=r ~/venpopov.com/_site/ venpopov.com:/home4/venpopov/public_html/"
alias create_temp_dir='temp_dir=$(mktemp -d) && cd $temp_dir'



# Lazy git
function lgit() {
  git add .
  git commit -a -m "$1"
  git push
}
