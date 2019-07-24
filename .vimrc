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

Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>[
"Plugin 'scrooloose/syntastic'
Plugin 'vim-syntastic/syntastic' "changed to this from line above
Plugin 'nvie/vim-flake8'
let python_highlight_all=1
" Plugin 'jnurmine/Zenburn'
" Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" search for anything from vim
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
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
Plugin 'prettier/vim-prettier'
Plugin 'vim-ruby/vim-ruby'
Plugin 'chrisbra/csv.vim'
Plugin 'unblevable/quick-scope'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"============SETTINGS=================================================
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

" Set Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" remap gcc to CTRL-? for vim-commentary
map c gc
xmap cc gc

" make test commands execute using vimux 
let test#strategy = "vimux"

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

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

"vv to generate new vertical split
nnoremap <silent> vv <C-w>v
nnoremap <silent> zz <C-w>s

"remap save and run with python3
cnoremap wp w !python3

"remap escape key to jk
inoremap jk <esc>|

"set clipboard
set clipboard=unnamedplus


"set splits
set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99 
" Enable folding with the spacebar
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

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

"flag unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

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

"turn on line numbering in NERDtree
set nu

" NerdTree config
"hide .pyc file in NERDtrees
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
let NERDTreeToggleQuitOnOpen = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"" Tab completion for rails
"set wildmode=list:longest,list:full
"set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

"set highlight line
:set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40
