autoload -U compinit
compinit -u

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

## COLOR ##
local GREEN=$'%{\e[1;32m%}'
local BLUE=$'%{\e[1;34m%}'
local DEFAULT=$'%{\e[1;m%}'
local GRAY=$'%{\e[1;33m%}'
local HOSTNAME=`hostname`


## PROMPT ##
#PROMPT="
# ${BLUE}%~${DEFAULT} ${vcs_info_msg_0_} %(v|%F{green}%1v%f|)
# ${BLUE}${HOSTNAME%%.*} %(!.#.$) "
#
#PROMPT2='[%n]> ' 
PROMPT="
%n ${BLUE}%~${DEFAULT} ${vcs_info_msg_0_} %(v|%F{green}%1v%f|)
${HOST%%.*} $ "

PROMPT2='[%n]> '
#PROMPT="${GREEN}${USERNAME}${DEFAULT} @${BLUE}${HOSTNAME##-*}${DEFAULT} %(!.#.$) "
#PROMPT="${GREEN}${USERNAME}${DEFAULT} @${BLUE}${HOSTNAME%%.*}${DEFAULT} %(!.#.$) "
#RPROMPT="[${BLUE}%~${DEFAULT}] ${vcs_info_msg_0_} $ %(v|%F{green}%1v%f|)"
#PROMPT="%/%% "
#PROMPT2="%_%% "
#PROMPT2="[${BLUE}%~${DEFAULT}] ${vcs_info_msg_0_} $ %(v|%F{green}%1v%f|)"
SPROMPT="%r is correct? [n,y,a,e]: "
setopt PROMPT_SUBST
setopt autopushd

## COMMAND HISTORY ##
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

## ENV ##
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
export EDITOR=/usr/local/Cellar/vim/7.4.161/bin/vim
export ANDROID_SDK_HOME=$HOME/Library/android-sdks
export PATH=/usr/local/bin:/usr/local/sbin:$PATH:$HOME/.rvm/bin:$HOME/bin:$ANDROID_SDK_HOME/platform-tools:$ANDROID_SDK_HOME/tools
export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"

## PROXY SETTING ##
#export HTTP_PROXY=http://

## ALIAS ##
# for coreutils
alias vim='/usr/local/Cellar/vim/7.4.161/bin/vim "$@"'
alias grep='grep -n "$@"'
alias be='bundle exec "$@"'
alias gd='dirs -v; echo -n "select number: "; read newdir; cd -"$newdir"'
alias ls='ls -F --color=auto'
alias ll='ls -la --color=auto'
alias la='ls -a --color=auto'
alias bi='bundle install'
alias be='bundle exec'

## for ant
#export ANT_OPTS=-Dfile.encoding=UTF-8

## DIRCOLORS ##
eval `dircolors ~/.dir_colors -b`

eval "$(rbenv init - zsh)"
