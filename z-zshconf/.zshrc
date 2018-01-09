# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

ZSH_THEME="ys"

# Base16 Shell
# BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
# [[ -s $BASE16_SHELL  ]] && source $BASE16_SHELL

# 10ms for key sequences
KEYTIMEOUT=1

# Fix ssh-agent in tmux env
source ~/.ssh-find-agent/ssh-find-agent.sh
if ! test $SSH_AUTH_SOCK; then
  set_ssh_agent_socket
fi

# gen my static blog by buster
function gen() {
  cd ~/my_web_dev/Cool4zbl.com/gh-page-buster/
  buster generate --domain=http://127.0.0.1:2368
  cd static
  git add .
  git commit -m "$1"
  git push
  open -a Google\ Chrome http://cool4zbl.github.io
  cd ~
}

# alias for mcd
function mcd() {
  mkdir -p "$1" && cd "$1"
}

# Open files
alias typora="open -a /Applications/Typora.app"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# NPM
alias set-npmjs="npm config set registry http://registry.npmjs.org"
alias set-npmtb="npm config set registry http://registry.npmjs.taobao.org"
alias set-npmmt="npm config set registry http://r.npm.sankuai.com"
NODE_DIST="http://nodejs.mirrors.mx.sankuai.com/dist/"
MNPM_REGISTRY="http://r.npm.sankuai.com"
alias mp="npm --registry=$MNPM_REGISTRY --disturl=$NODE_DIST --userconfig=$HOME/.mnpmrc  --cache=$HOME/.cache/mnpm"
export npm_config_fse_binary_host_mirror="https://npm.taobao.org/mirrors/fsevents/"
# nvm
alias nu6="nvm use v6"
alias nu7="nvm use v7"
alias nu8="nvm use v8"

# standard js files
alias std="standard"
alias stdf="standard --fix"

# Config
alias vi="reattach-to-user-namespace vim"
alias vim="reattach-to-user-namespace vim"
alias ohmyzsh="vi ~/.oh-my-zsh"
alias gitconfig="vi ~/.gitconfig"
alias zshconfig="vi ~/.zshrc"
alias tmuxconfig="vi ~/.tmux.conf"
alias vimconfig="vi ~/.vimrc"
alias eslintrc="vi ~/.eslintrc"

# Tmux
alias nt="tmux new -s"
alias ta="tmux a -t"
alias tl="tmux ls"

# Proxy
# alias gfw="http_proxy=http://127.0.0.1:8118 https_proxy=https://127.0.0.1:8118"
alias gfwoff="unset https_proxy && unset http_proxy"
function proxy_off(){
    unset http_proxy
    unset https_proxy
    echo -e "已关闭代理"
}
function proxy_on() {
    export no_proxy="localhost,127.0.0.1,localaddress,github.intra.douban.com,"
    export http_proxy="http://127.0.0.1:1086"
    export https_proxy=$http_proxy
    echo -e "已开启代理"
}
function start_proxy() {
    sudo /usr/local/sbin/privoxy /usr/local/etc/privoxy/config
}
alias proxyconfig="vim /usr/local/etc/privoxy/config"

function start_pg() {
    pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
}

function stop_pg() {
    pg_ctl -D /usr/local/var/postgres stop -s -m fast
}

# VPS
alias govps="ssh root@162.243.153.50 -vvv"
alias moshvps="LC_ALL='en_US.UTF-8' mosh root@162.243.153.50"
alias vps="root@162.243.153.50"
alias vpsip="162.243.153.50"

# Douban work
alias moshdev="LC_ALL='en_US.UTF-8' mosh zhangbinliu@doubandev2"
alias dev="ssh zhangbinliu@doubandev2"
alias dpc="dae pre create --scm github -r"
alias dpu="dae pre update --pre"
alias dps="dae pre switch --pre"
alias dpl="dae pre list"
alias dpe="dae pre edit -u zhangbinliu --pre"

# Zed-sync
alias zp="zed-sync --ld -p"
alias zu="zed-sync -u"
alias test_zu="node ~/localdev2/zed-sync/index.js -u"

# Habitica
alias hab="habitica"

# proxychains4
alias pc4="proxychains4"

# jscodeshift
alias jcf="jscodeshift"


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git osx z pip brew autojump docker vi yarn web-search ruby)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/bin:/usr/bin:/usr/local/bin:$PATH
export PATH=/Users/zhangbinliu/mongodb/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# Fix mosh
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'
# Note: I just use vim in tmux now
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# use `j` to everywhere
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# yarn
export PATH="$PATH:/usr/local/opt/yarn-v0.27.5/bin"
# export PATH="$PATH:`yarn global bin`"

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

# Go
export PATH="$PATH:/usr/local/go/bin"

# tmuxinator
source ~/.tmux/tmuxinator.zsh

# iTerm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export PATH="/usr/local/sbin:$PATH"
export TERM=xterm-256color-italic

# fix https://github.com/tmux/tmux/issues/475
export EVENT_NOKQUEUE=1
###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###
# Make sure NVM_DIR is the last export
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# export NVM_DIR="$HOME/.nvm"
