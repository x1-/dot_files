# 少し凝った zshrc
 
########################################
# 環境変数
export LANG=ja_JP.UTF-8


# 色を使用出来るようにする
autoload -Uz colors
colors

# emacs 風キーバインドにする
bindkey -e
bindkey "^[[3~" delete-char
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
 
# プロンプト
# 1行表示
#PROMPT="%~ %# "
PROMPT="%{${fg[red]}%}[%n@%m]%{${reset_color}%} %~ %# "
# 2行表示
#PROMPT="%{${fg[red]}%}[%n@%m]%{${reset_color}%} %~
#%# "
 
 
# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified
 
########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit
 
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
 
# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..
 
# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
 
# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
 
 
########################################
# vcs_info
 
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"
 
 
########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit
 
# beep を無効にする
setopt no_beep
 
# フローコントロールを無効にする
setopt no_flow_control
 
# '#' 以降をコメントとして扱う
setopt interactive_comments
 
# ディレクトリ名だけでcdする
setopt auto_cd
 
# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups
 
# = の後はパス名として補完する
setopt magic_equal_subst
 
# 同時に起動したzshの間でヒストリを共有する
setopt share_history
 
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
 
# ヒストリファイルに保存するとき、すでに重複したコマンドがあったら古い方を削除する
setopt hist_save_nodups
 
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
 
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks
 
# 補完候補が複数あるときに自動的に一覧表示する
setopt auto_menu
 
# 高機能なワイルドカード展開を使用する
setopt extended_glob
 
########################################
# キーバインド
 
# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward
 
########################################
# エイリアス

alias la='ls -a'
alias ll='ls -l'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'
#alias git='hub'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

alias -g P='| peco'
if [ -x "`which peco`" ]; then
  alias ll='ls -la | peco'
  alias tp='top | peco'
  alias pp='ps aux | peco'
fi

alias emacs="TERM=xterm-256color reattach-to-user-namespace /usr/local/bin/emacs"

# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi
 
 
########################################
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        #Linux用の設定
        ;;
esac

### jvm
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_60.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_65.jdk/Contents/Home
export M2_HOME=~/tools/maven
export MAVEN_OPTS="-Xmx2g -XX:MaxPermSize=512M -XX:ReservedCodeCacheSize=512M"

# vim:set ft=zsh:
export PATH="/Users/a12884/bin:$JAVA_HOME/bin:$PATH:$HOME/tools/scala/bin:$HOME/tools/jad"

# hadoop
export PATH="/usr/local/hadoop/bin-mapreduce1:$PATH"

### rbenv(for ruby) ###
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"
##PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
#
#if [ -n "$TMUX" ]; then
#  export PATH=$HOME/.rbenv/shims:$PATH
#fi

#unset LD_LIBRARY_PATH
unset DYLD_LIBRARY_PATH
LD_LIBRARY_PATH=/usr/local/lib

### tmuxinator ###
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator



### home brew
export HOMEBREW_GITHUB_API_TOKEN=9f78ecb949d5eebfb866d7544f2b2590212bc50e

### php
#export PHP_VERSIONS=$HOME/local/php/versions
#source $(brew --prefix php-version)/php-version.sh && php-version 5.6.1 >/dev/null

### virtualenv
which virtualenvwrapper.sh > /dev/null
if [ $? -eq 0 ]; then
    source `which virtualenvwrapper.sh`
    mkdir -p ~/.virtualenvs
    export WORKON_HOME=~/.virtualenvs
    export PIP_RESPECT_VIRTUALENV=true
fi

### pythonz
[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc
PYTHONZ_ROOT=~/.pythonz
# Pythonz
if [ -s $HOME/.pythonz/etc/bashrc ]; then
    source $HOME/.pythonz/etc/bashrc
fi

export EDITOR=/usr/bin/vim
export SHELL=/bin/zsh

# The next line updates PATH for the Google Cloud SDK.
source '/Users/a12884/tools/google-cloud-sdk/path.zsh.inc'

# The next line enables bash completion for gcloud.
#source '/Users/a12884/tools/google-cloud-sdk/completion.zsh.inc'
