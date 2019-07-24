#####
# In not-very-good linux style, this is organized with newest aliases on top, oldest on bottom
#####

# sudo netctl switch-to is hard to type
alias net='sudo netctl switch-to'
alias netl='netctl list'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#tired of typing "clear"?
alias c='clear'

#download script alias
alias download='bash ~/bin/download.sh'

#work wifi
alias env='sudo netctl switch-to env'

#source .bashrc
alias sb='. ~/.bashrc'

#edit your .bashrc
alias brc='vim ~/.bashrc'
alias bal='vim ~/.bash_aliases'

#make bluetooth easier to use
alias bt='bluetoothctl'

# make xclip copy to system clipboard, pipe to xclip i.e. grep foo.txt | xclip
alias xclip='xclip -selection c'

#remap gcalcli
alias g='gcalcli'

#debug with pudb
alias debug='python -m pudb.run'

#open Jupyter Lab with epiphany (fuckin' hotkeys)
#alias jupyter='jupyter lab --browser=epiphany'

#Enviromin office monitor
alias exr='xrandr --output DP-2 --auto --left-of eDP-1'

#make dropbox-cli easier to type
alias db='dropbox-cli'

#run sup with ruby 2.3.3 so it don't break
alias sup='rvm 2.3.3 do sup'

#make ranger easy
alias r='ranger'
alias rr='sudo ranger'

#alias to call todo.txt from anywhere
#alias todo='~/todo.txt_cli-2.10.0/todo.sh'

#alias for Soulseek
alias soulseek='/opt/Soulseek/SoulseekQt-2016-1-17-64bit'

#alias for python3 as python and python2 as python2
alias python='python3'

#alias for external monitor at 1920x1080 res
alias screens='xrandr --output DP-2 --scale 2x2'

#alias for python3
alias p3='python3'

#alias mount command for windows partition
#alias winmnt='sudo mount -r /dev/nvme0n1p3 /mnt/Windows'

#alias shutdown
alias die='shutdown -P now'

#alias ranger to exit in directory navigated to
alias ranger='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"'

#alias command to for github
#new command for latest dev is git clone github/'dev_version'
alias github='https://github.com'

#alias command to ssh to mlabvpn
alias mlab="ssh -X -Y gegnew@thinker"

# automate command to send a file to gegnew@thinker on mlabvpn
# clearly, I need to figure out a way to set a generic filename for this
alias mlabsend="scp ppsth2.m gegnew@thinker:/auto/home/gegnew/msgrating" 

# commands dtouch and etouch activate or deactivate touchpad
alias dtouch='xinput set-prop `xinput list | grep -i touchpad | cut -f 2 | grep -oE '[[:digit:]]+'` "Device Enabled" 0'
alias etouch='xinput set-prop `xinput list | grep -i touchpad | cut -f 2 | grep -oE '[[:digit:]]+'` "Device Enabled" 1'

# alias git log
alias gl='git log --oneline --all --graph'
