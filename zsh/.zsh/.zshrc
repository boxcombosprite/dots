fpath=(
    $ZDOTDIR/prompt
    $fpath
)

() {
    local funcs=$ZDOTDIR/func

    typeset -TUg +x FPATH=$funcs:$FPATH fpath

    if [[ -d $funcs ]]; then
        autoload ${=$(cd "$funcs" && echo *)}
    fi
}

setopt promptsubst
setopt interactivecomments
setopt numericglobsort

autoload -Uz promptinit
promptinit
prompt witch

eval $(dircolors)

export GPG_TTY=$(tty)

# The following lines were added by compinstall

zstyle ':completion:*' completer _oldlist _expand _complete _ignored _match _correct _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' glob 1
zstyle ':completion:*' ignore-parents parent pwd .. directory
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '+' 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select
zstyle ':completion:*' prompt '%e errors'
zstyle ':completion:*' substitute 'NUMERIC == 2'
zstyle ':completion:*' use-compctl false
zstyle :compinstall filename '/home/pasta/.zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt notify
bindkey -v
# End of lines configured by zsh-newuser-install

export VISUAL=vim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line
bindkey -M viins '^[.' insert-last-word

bindkey -M viins '^y' autosuggest-accept

alias ls='ls --color=auto'
alias vim='nvim'
alias vxxd='vim -b -c ":%!xxd" -c "set nomodified ft=xxd"'
alias vide='vim -c ":10 sp | term" -c ":Neotree" -c ":wincmd h"'
alias td='cd $(mktemp -d)'
alias xo='xdg-open'

zle-keymap-select () {
    case $KEYMAP in
        vicmd) printf "\033[2 q";;
        viins|main) printf "\033[5 q";;
    esac
}

zle-line-init () {
    zle -K viins
    printf "\033[5 q"
}

zle -N zle-keymap-select
zle -N zle-line-init

[[ ! -r '/home/pasta/.opam/opam-init/init.zsh' ]] || source '/home/pasta/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null

# plugins
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# vim: ts=4 sts=4 sw=4 expandtab
