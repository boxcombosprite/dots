fpath=(
    $ZDOTDIR/prompt
    $fpath
)

# this doesnt work for some reason??
#autoload -Uz promptinit
#promptinit
#prompt witch

eval $(dircolors)

# The following lines were added by compinstall

zstyle ':completion:*' completer _oldlist _expand _complete _ignored _match _correct _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' glob 1
zstyle ':completion:*' ignore-parents parent pwd .. directory
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '+' 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=long
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

autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

alias ls='ls --color=auto'
alias vim='nvim'
alias vxxd='vim -b -c ":%!xxd" -c "set nomodified ft=xxd"'

fkill() {
    local pid
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}

[[ ! -r '/home/pasta/.opam/opam-init/init.zsh' ]] || source '/home/pasta/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [ ! -f "$SSH_AUTH_SOCK" ]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

export VISUAL=vim
export GPG_TTY=$(tty)

# plugins
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

PROMPT="%B%F{yellow}%n%f%b %F{green}%~%f $ "

# vim: ts=4 sts=4 sw=4 expandtab
