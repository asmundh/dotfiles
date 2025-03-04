# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use powerline
USE_POWERLINE="true"

HISTFILE=~/.history_zsh
SAVEHIST=10000
HISTSIZE=10000
HISTORY_IGNORE="(ls|ps|history|q|exit|shutdown|shutdown now)"

# Do not add lines starting with whitespace to history
setopt HIST_IGNORE_SPACE

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

my-backward-delete-word () {
        local WORDCHARS='~!#$%^&*(){}[]<>?+;'
        zle backward-delete-word
}
zle -N my-backward-delete-word

bindkey    '\e^?' my-backward-delete-word

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh


eval "$(fasd --init auto)"

source ~/.aliasesrc

source ~/.vyaliasesrc
source ~/.scripts/vyscripts/ekern

export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-c"

export EDITOR=vim

# To use pyenv
#eval "$(pyenv init -)"
eval "$(pyenv init --path)"

# Autocompletion - requries zsh-autosuggestions from AUR
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

DISABLE_MAGIC_FUNCTIONS=true
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
