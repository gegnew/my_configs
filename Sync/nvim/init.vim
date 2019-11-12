" Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'neomake/neomake'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
" Plug 'jiangmiao/auto-pairs'
" TODO
Plug 'jpribyl/vim-ipython' " Johnny's fix for vim-ipython on Arch
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tmhedberg/SimpylFold'
Plug 'christoomey/vim-tmux-navigator'
Plug 'prettier/vim-prettier'
Plug 'KeitaNakamura/neodark.vim'
" For deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/neco-syntax' " Generic syntax completion (on Arch you need to `yay -S words`)
Plug 'ujihisa/neco-look' " Dictionary completion
Plug 'deoplete-plugins/deoplete-jedi' " Python completion
Plug 'wellle/tmux-complete.vim' " Complete words in adjacent tmux panes
Plug 'prabirshrestha/async.vim' " Async for tmux-complete, needed for deoplete integration
Plug 'prabirshrestha/asyncomplete.vim' " ditto
Plug 'psf/black'

call plug#end()

 
" Plugin Configs

" Use deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:tmuxcomplete#trigger = ''
" let g:python3_host_prog = '/home/g/.pyenv/versions/3.7.4/bin/python' "pynvim for deoplete

" Ignore english autocomplete in python
let g:deoplete#ignore_sources = get(g:,'deoplete#ignore_sources',{})
let g:deoplete#ignore_sources.python = ['look']
let g:deoplete#custom#option#on_insert_enter = 'false'

" Run NeoMake on read and write operations
autocmd! BufReadPost,BufWritePost * Neomake
" Disable inherited syntastic
let g:syntastic_mode_map = {
			\"mode": "passive",
			\"active_filetypes": [],
			\"passive_filetypes": [] }

let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1

" NerdTree config
" turn in line numbering in nerdtree
set nu
" hide .pyc file in NERDtrees
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

" Neodark colorscheme config
colorscheme neodark
let g:neodark#terminal_transparent = 1

" Run Black on save
autocmd BufWritePre *.py execute ':Black'



"===========SETTINGS============
" General
set nocompatible
filetype off
syntax on
set number
set relativenumber
set encoding=utf-8
set autoindent " Copy indent from last line when starting a new line
set autoread " Set to autoread when a file is changed from the outside
set ignorecase
set backspace=indent,eol,start
set clipboard=unnamedplus
set cursorline
    hi CursorLine term=bold cterm=bold guibg=Grey40 ctermbg=NONE
set splitbelow " New window goes below
set splitright " New window goes right
set foldmethod=indent " Enable folding
set foldlevel=99 
nnoremap <space> za " Enable folding with the spacebar
let g:SimpylFold_docstring_preview=1
set ignorecase
set nowrap
set scrolloff=3
set shortmess=atI " Don't show the vim intro message
set undofile " Persistent undo
set wrapscan " Wrap searches around end of file
let mapleader = "," " Map leader key
"remap escape key to jk
    inoremap jk <esc>| 
" Set proper tabs
    set tabstop=4
    set shiftwidth=4
    set smarttab
    set expandtab
" Remap save
    map <Leader>s :w<Enter>
    map <Leader>sd :wq<Enter>
    map <Leader>q :q!<Enter>
let g:airline_theme='neodark'  " Set airline theme
"split navigations
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>
" Allow saving of files as sudo when I forgot to start vim using sudo.
    cmap w!! w !sudo tee > /dev/null %
" Generate splits
    nnoremap <silent> vv <C-w>v
    nnoremap <silent> zz <C-w>s
" Flag unnecessary whitespace
    highlight BadWhitespace ctermbg=red guibg=darkred
    au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" Treat .svelte files as HTML
    au! BufNewFile,Bufread *.svelte set ft=html
" remap buffer list
   map <Leader>b :ls<Enter>
" Useful commands
"nvim +checkhealth
" Change spaces to tabs in makefiles
autocmd FileType make setlocal noexpandtab
