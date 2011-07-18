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

##### COLOR ######
local GREEN=$'%{\e[1;32m%}'
local BLUE=$'%{\e[1;34m%}'
local DEFAULT=$'%{\e[1;m%}'
local GRAY=$'%{\e[1;33m%}'
local HOSTNAME=`hostname`


#export LANG=ja_JP.eucJP
#export LANG=ja_JP.SJIS
#PROMPT="${GREEN}${USERNAME}${DEFAULT} @${BLUE}${HOSTNAME##-*}${DEFAULT} %(!.#.$) "
PROMPT="${GREEN}${USERNAME}${DEFAULT} @${BLUE}${HOSTNAME%%.*}${DEFAULT} %(!.#.$) "
RPROMPT="[${BLUE}%~${DEFAULT}] ${vcs_info_msg_0_} $ %(v|%F{green}%1v%f|)"
#PROMPT="%/%% "
PROMPT2="%_%% "
SPROMPT="%r is correct? [n,y,a,e]: "

setopt PROMPT_SUBST
setopt autopushd
alias gd='dirs -v; echo -n "select number: "; read newdir; cd -"$newdir"'

## COMMAND HISTORY
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data


# alias
#alias ls='ls -F --color=auto'
#alias ll='ls -la --color=auto'
#alias la='ls -a --color=auto'

#PROXY SETTING
#export HTTP_PROXY=http://

# dircolors
#eval `dircolors ~/.dir_colors -b`

# PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH:$HOME/.rvm/bin:$HOME/bin
export PATH=$PATH:/Applications/android-sdk-mac_x86/tools

# ENV
export DAFLOID=/Users/kzsg/workspace/dafloid-cms/

if [[ -s /Users/kzsg/.rvm/scripts/rvm ]] ; then source /Users/kzsg/.rvm/scripts/rvm ; fi

export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
#export EDITOR=/usr/local/bin/mate
#alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
#alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias mvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/MacVim "$@"'
alias grep='grep -n "$@"'
alias cddaf='cd ~/workspace/dafloid-cms/'
alias cdbene='cd ~/workspace/'

alias be='bundle exec "$@"'


