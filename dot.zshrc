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

#PROMPT="${GREEN}${USERNAME}${DEFAULT} @${BLUE}${HOSTNAME##-*}${DEFAULT} %(!.#.$) "
PROMPT="${GREEN}${USERNAME}${DEFAULT} @${BLUE}${HOSTNAME%%.*}${DEFAULT} %(!.#.$) "
RPROMPT="[${BLUE}%~${DEFAULT}] ${vcs_info_msg_0_} $ %(v|%F{green}%1v%f|)"
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
export EDITOR=/usr/local/bin/vim
export ANDROID_SDK_HOME=$HOME/android-sdks
export PATH=/usr/local/bin:/usr/local/sbin:$PATH:$HOME/.rvm/bin:$HOME/bin:$ANDROID_SDK_HOME/platform-tools:$ANDROID_SDK_HOME/tools
export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

## PROXY SETTING ##
#export HTTP_PROXY=http://

## ALIAS ##
# for coreutils
alias mvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/MacVim "$@"'
alias vim='/usr/local/bin/vim "$@"'
alias grep='grep -n "$@"'
alias be='bundle exec "$@"'
alias gd='dirs -v; echo -n "select number: "; read newdir; cd -"$newdir"'
alias ls='/usr/local/bin/gls -F --color=auto'
alias ll='/usr/local/bin/gls -la --color=auto'
alias la='/usr/local/bin/gls -a --color=auto'


## DIRCOLORS ##
eval `dircolors ~/.dir_colors -b`
