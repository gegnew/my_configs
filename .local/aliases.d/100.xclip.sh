# make xclip copy to system clipboard, pipe to xclip i.e. grep foo.txt | xclip
alias xclip='xclip -selection c'
alias yy='xclip'
alias yy1='-selection primary'
alias yy2='-selection secondary'
alias pp='xclip -o -sel clip'
alias yi='xclip -sel clip -t image/png'
alias pf='xclip -o -sel clip >'
