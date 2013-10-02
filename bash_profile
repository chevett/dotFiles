PATH=~/bin:$PATH
export PATH="/usr/local/heroku/bin:$PATH"
export EDITOR='vim'
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

alias 'cd..'='cd ..'
alias ll="ls -lv" # --group-directories-first
alias lm='ll |more'        #  Pipe through 'more'
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
alias 8888='~/code/8888/sync' #do the ploy port 8888 style


GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS="yes"

export PROMPT_COMMAND='__git_ps1 "\[\033[0;32m\]\u\[\033[0;255m\]@\[\033[0;32m\]\h:\[\033[0;97m\]\W\[\033[0;255m\]" "\\\$ ";'



[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

function purl { curl "$@" | prettyjson ; }
function cdl { cd $1; ls;}
