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
alias jpp='python -mjson.tool | less'
alias jpp2='prettyjson | less -R'
alias dif='git --no-pager diff'
alias testTango='/Users/mchevett/adnxs/hbui/master/tests/PhantomJasmine/runUnitTests.py -c -d myDevBox'
alias tangoTests='testTango'
alias hbuiTests='testTango'
alias find=gfind #use find from homebrew
#alias sed='gsed -r' #use find from homebrew
alias lastcmd="history | tail -n 2 | head -n 1 | sed 's/\s*[0-9]\s*//g' | pbcopy"
alias nind="gfind -iname"
stty -ixon -ixoff # this allows ctrl-s in vim

function purl { curl -b cookies -c cookies "$@" | prettyjson | less -R; }
function cdl { cd $1; ls;}
function cm() { git commit -am "$*"; }

# random stuff really just for reference when i forget
alias list-terminals='find /usr/share/terminfo -type f'

# run other stuff
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "$HOME/.bash_profile.private" ]] && source "$HOME/.bash_profile.private"
[[ -d "/Users/mchevett/Library/Python/2.7/lib/python/site-packages/powerline/bindings/bash" ]] && . /Users/mchevett/Library/Python/2.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh
