#export PATH=/usr/local/bin:


if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

alias 'cd..'='cd ..'
alias ll="ls -lv" # --group-directories-first"
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...
alias jpp='python -mjson.tool'


alias ipReset='sudo ipconfig set en0 BOOTP && sudo ipconfig set en0 DHCP && sudo launchctl stop com.apple.racoon && sudo launchctl start com.apple.racoon'
alias txt="sublime"

alias commitLink='sh /users/mchevett/scripts/commitLink'  

alias testTango='/Users/mchevett/adnxs/hbui/master/tests/PhantomJasmine/runUnitTests.py -c -d myDevBox'
alias tangoTests='testTango'
alias hbuiTests='testTango'

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

#export PS1="\u@\h \W\e[1;33m\]\$(parse_git_branch)\e[m $ "

GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS="yes"


export PROMPT_COMMAND='__git_ps1 "\u@\h:\W" "\\\$ ";'

