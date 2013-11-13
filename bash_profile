PATH=~/bin:$PATH
PATH=~/Library/Python/2.7/bin:$PATH

export PATH="/usr/local/heroku/bin:$PATH"
export EDITOR='vim'
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

alias 'cd..'='cd ..'
alias ll="ls -lvh" # --group-directories-first
alias lm='ll | 	less'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...
alias jpp='python -mjson.tool'
alias dif='git --no-pager diff'
alias commitLink='sh /users/mchevett/scripts/commitLink'  
alias testTango='/Users/mchevett/adnxs/hbui/master/tests/PhantomJasmine/runUnitTests.py -c -d myDevBox'
alias tangoTests='testTango'
alias hbuiTests='testTango'
alias find=gfind #use find from homebrew
alias sed='gsed -r' #use find from homebrew
alias lastcmd="history | tail -n 2 | head -n 1 | sed 's/\s*[0-9]\s*//g' | pbcopy"
alias nind="gfind -iname"
stty -ixon -ixoff # this allows ctrl-s in vim

GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS="yes"

export PROMPT_COMMAND='__git_ps1 "\[\033[0;32m\]\u\[\033[0;255m\]@\[\033[0;32m\]\h:\[\033[0;97m\]\W\[\033[0;214m\]" "\\\$ ";'



[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

function purl { curl "$@" | prettyjson ; }
function cdl { cd $1; ls;}

. /Users/mchevett/Library/Python/2.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh
