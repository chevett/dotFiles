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
	PS1="\h:\W \u\$(__git_ps1 \" (%s) \")\$"
fi

alias 'cd..'='cd ..'
alias ll="ls -lvh" # --group-directories-first
alias lm='ll | 	less'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
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

function purl { curl -b cookies -c cookies "$@" | prettyjson | less -R; }
function cdl { cd $1; ls;}
function cm() { git commit -am "$*"; }
function lastfiletime(){
	echo "$(ll -tr | tail -1 | awk '{print $8;}') vs $(date | awk '{print $4;}')"
}
function killp() { 
	local d=$(lsof -i :"$1" | tail -1)
	local p
	local n
	
	if [[ -z "$d" ]]; then
		echo "Nothing running on $1."
		return 666;
	fi

	read n p _ < <(echo "$d");
	read -p "Kill $n($p)? " -n 1 -r
	
	echo "";

	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		echo "not killed.";
		return 666;
	else 
		kill "$p";
		echo "killed.";
	fi
}
# random stuff really just for reference when i forget
alias list-terminals='find /usr/share/terminfo -type f'
alias show-path="echo $PATH | tr ':' '\n'"

# run other stuff
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "$HOME/.bash_profile.private" ]] && source "$HOME/.bash_profile.private"
[[ -s "$HOME/code/dotFiles/anx-api/init" ]] && source "$HOME/code/dotFiles/anx-api/init"

