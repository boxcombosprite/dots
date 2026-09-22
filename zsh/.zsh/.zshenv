PATH=$HOME/.local/share/gem/ruby/3.4.0/bin:$HOME/.dotnet/tools:$HOME/go/bin:$HOME/.local/bin:$PATH
export PATH
# Unity CLI
case ":${PATH}:" in *:"$HOME/.local/bin":*) ;; *) export PATH="$HOME/.local/bin:$PATH" ;; esac

export EDITOR=/usr/bin/nvim
export PAGER=/usr/bin/less

