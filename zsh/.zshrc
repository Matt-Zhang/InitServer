# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

export LC_ALL="en_US.UTF-8"
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#alias
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -alF'

# other aliases
alias taskrss='ps -u $USER -o state,pid,rss,%cpu,command -m'
alias taskcpu='ps -u $USER -o state,pid,rss,%cpu,command -r'
alias g='python ~/Public/goagent/local/proxy.py'


alias pg-start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg-stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

DISABLE_AUTO_UPDATE="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh
autoload -U compinit
compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
setopt correctall
setopt hist_ignore_all_dups
