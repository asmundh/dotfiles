# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use powerline
USE_POWERLINE="true"

# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTIGNORE="ls:ps:history:q:exit:shutdown:shutdown now"
export HISTTIMEFORMAT="%F %T "

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh


eval "$(fasd --init auto)"

source /usr/share/nvm/init-nvm.sh
source ~/.aliasesrc
alias ssh="kitty +kitten ssh"

source ~/.vyaliasesrc
source ~/.scripts/vyscripts/ekern
source ~/.scripts/pomo

# Use `bat` as a paget for `man`
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-c"

#alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
#alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

DISABLE_MAGIC_FUNCTIONS=true
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
