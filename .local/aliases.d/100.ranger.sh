#make ranger easy
alias r='ranger'
alias rr='sudo ranger'

#alias ranger to exit in directory navigated to
alias ranger='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"'
