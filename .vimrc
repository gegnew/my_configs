set nocompatible              " required
filetype off                  " required
syntax on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"[call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"============PLUGINS=================================================
"most plugins and settings as of 3/20/18 from:
"https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/

Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
let g:ycm_autoclose_preview_window_after_completion=1
map <Leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>[
"Plugin 'scrooloose/syntastic'
Plugin 'vim-syntastic/syntastic' "changed to this from line above
let python_highlight_all=1
" Plugin 'jnurmine/Zenburn'
" Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" search for anything from vim
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-rails.git'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'benmills/vimux'
"Plugin 'janko-m/vim-test'
"Plugin 'ivanov/vim-ipython'
"Plugin 'julienr/vim-cellmode'
Plugin 'jgors/vimux-ipy'
Plugin 'tpope/vim-obsession'
Plugin 'junegunn/rainbow_parentheses.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'vim-ruby/vim-ruby'
Plugin 'chrisbra/csv.vim'
Plugin 'unblevable/quick-scope'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"============SETTINGS=================================================
"map leader key
let mapleader = ","

"vimux-ipy config
map <Leader>vp :call VimuxIpy()<CR>
vmap <silent> <Leader>e :python run_visual_code()<CR>
noremap <silent> <Leader>c :python run_cell(save_position=False, cell_delim='##')<CR>

"I'm not actually sure wtf vim-test is/does
"vim-test config
nmap <silent> t<C-n> :TestNearest<CR> " t Ctrl+n
nmap <silent> t<C-f> :TestFile<CR>    " t Ctrl+f
nmap <silent> t<C-s> :TestSuite<CR>   " t Ctrl+s
nmap <silent> t<C-l> :TestLast<CR>    " t Ctrl+l
nmap <silent> t<C-g> :TestVisit<CR>   " t Ctrl+g

" make test commands execute using vimux 
let test#strategy = "vimux"

"Vimux config from Johnny P
"Run the current file with rspec
nnoremap <Leader>vn :call VimuxRunCommand("clear; python " . bufname("%"))<CR>

"Run the current file with python
"nnoremap <Leader>vp :call VimuxRunCommand("clear; python)<CR>

"propmt for a command
nnoremap <Leader><space> :VimuxPromptCommand<CR>

"Run last command executed by VimuxRunCommand
nnoremap <Leader>vl :w\|:VimuxRunLastCommand<CR>
inoremap <Leader>vl <esc>:w\|:VimuxRunLastCommand<CR>

"Inspect runner pane
map <Leader>vi :VimuxInspectRunner<Cr>

"Zoom the tmux runner pane
map <Leader>vz :VimuxZoomRunner<CR>

"remap save and run with python3
cnoremap wp w !python3


"PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |


"UTF8 sypport
set encoding=utf-8

"python with virtualenv support
"I found the line below as 'py << EOF'
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
