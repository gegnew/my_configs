# commands dtouch and etouch activate or deactivate touchpad
alias dtouch='xinput set-prop `xinput list | grep -i touchpad | cut -f 2 | grep -oE '[[:digit:]]+'` "Device Enabled" 0'
alias etouch='xinput set-prop `xinput list | grep -i touchpad | cut -f 2 | grep -oE '[[:digit:]]+'` "Device Enabled" 1'
