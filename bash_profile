#! /usr/bin/env bash
source ~/.bash_colors

PATH=~/bin:$PATH
PATH=~/Library/Python/2.7/bin:$PATH

export ANDROID_HOME=/usr/local/opt/android-sdk
export PATH="/usr/local/heroku/bin:$PATH"
export EDITOR='vim'
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
    source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
	GIT_PS1_SHOWUPSTREAM="auto"
	GIT_PS1_SHOWCOLORHINTS="yes"
	export PROMPT_COMMAND='__git_ps1 "\u@\W" "\\\$ ";'
	GIT_PS1_SHOWUNTRACKEDFILES='yes'
fi

alias 'cd..'='cd ..'
alias ll="ls -lvh" # --group-directories-first
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...
alias jpp='python -mjson.tool | less'
alias jpp2='prettyjson | less -R'
alias dif='git --no-pager diff'
alias testTango='/Users/mchevett/adnxs/hbui/master/tests/PhantomJasmine/runUnitTests.py -c -d myDevBox'
alias tangoTests='testTango'
alias hbuiTests='testTango'
alias find=gfind #use find from homebrew
#alias sed='gsed -r' #use find from homebrew
alias lastcmd="history | tail -n 2 | head -n 1 | gsed -r 's/^\s+[0-9]+\s+//g'  | pbcopy"
alias nind="gfind -iname"
alias j=json
stty -ixon -ixoff # this allows ctrl-s in vim

# random stuff really just for reference when i forget
alias list-terminals='find /usr/share/terminfo -type f'
alias show-path="echo $PATH | tr ':' '\n'";

function __runIfPresent(){
	[[ -s "$1" ]] && source "$1";
}
__runIfPresent "$HOME/.bash_functions"
__runIfPresent "$HOME/.rvm/scripts/rvm"
__runIfPresent "$HOME/.bash_profile.private"
__runIfPresent "$HOME/code/dotFiles/anx-api/init"
