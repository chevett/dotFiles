PATH=~/bin:$PATH

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


alias ipReset='sudo ipconfig set en0 BOOTP && sudo ipconfig set en0 DHCP && sudo launchctl stop com.apple.racoon && sudo launchctl start com.apple.racoon'

alias commitLink='sh /users/mchevett/scripts/commitLink'  

alias testTango='/Users/mchevett/adnxs/hbui/master/tests/PhantomJasmine/runUnitTests.py -c -d myDevBox'
alias tangoTests='testTango'
alias hbuiTests='testTango'


export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS="yes"

export PROMPT_COMMAND='__git_ps1 "\[\033[0;32m\]\u\[\033[0;255m\]@\[\033[0;32m\]\h:\[\033[0;97m\]\W\[\033[0;255m\]" "\\\$ ";'

alias find=gfind #use find from homebrew
