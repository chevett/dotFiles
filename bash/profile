#! /usr/bin/env bash

PATH=~/bin:$PATH
PATH=~/Library/Python/2.7/bin:$PATH

export ANDROID_HOME=/usr/local/opt/android-sdk
export PATH="/usr/local/heroku/bin:$PATH"
export EDITOR='vim'

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
    source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
	GIT_PS1_SHOWUPSTREAM="auto"
	GIT_PS1_SHOWCOLORHINTS="yes"
	export PROMPT_COMMAND='__git_ps1 "\u@\W" "\\\$ ";'
	GIT_PS1_SHOWUNTRACKEDFILES='yes'
fi

function __runIfPresent(){
	[[ -s "$1" ]] && source "$1";
}
__runIfPresent "$HOME/.bash_colors"
__runIfPresent "$HOME/.bash_alias"
__runIfPresent "$HOME/.bash_functions"
__runIfPresent "$HOME/.rvm/scripts/rvm"
__runIfPresent "$HOME/.bash_profile.private"
__runIfPresent "$HOME/code/dotFiles/anx-api/init"
