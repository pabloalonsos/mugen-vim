
" Allow all commands
set nocp
set nocompatible

" Remap Leader to ','
let mapleader=","

" Pathogen
call pathogen#infect()
call pathogen#helptags()

" Show status line always
set laststatus=2

" Set colorscheme
set background=dark
colorscheme hybrid

" Set font
set guifont=Source\ Code\ Pro\ for\ Powerline:h12

" Syntax highlight
syntax on

" Turn on the Wild menu
set wildmenu

"Always show current position
set ruler

" Set to auto read when a file is changed from the outside
set autoread

" Custom indentation based on type of file
filetype plugin indent on

" Show line numbers
set number

" Set relative line number
set relativenumber

" Set tabs
set tabstop=4
set shiftwidth=4

" Use spaces instead of tabs
set expandtab

" set clipboard to unnamed for tmux copy-paste
set clipboard=unnamed

" Configure backspace behavior
"    indent: backspace through automatic indent
"    eol: backspace through line break
"    start: backspace through start of 'insert'
set backspace=indent,eol,start

" Set whitespace character representation
set listchars=tab:>~,nbsp:_,trail:.
set list

" Set searching behavior
"    Highlight matches
set hlsearch
"    Ignore case sensitive
set ignorecase
" Case-sensitive if capital letters are included in search pattern
set smartcase

" Brackets and quotes

inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ((     (
inoremap ()     ()

inoremap [      []<Left>
inoremap [<CR>  [<CR>]<Esc>O
inoremap [[     [
inoremap []     []

inoremap "      ""<Left>
inoremap "<CR>  "<CR>"<Esc>O
inoremap ""     "

inoremap '      ''<Left>
inoremap '<CR>  '<CR>'<Esc>O
inoremap ''     '

inoremap <      <><Left>
inoremap <<CR>  <<CR>><Esc>O
inoremap <<     <
inoremap <>     <>

imap <C-j> <Esc>:exec <Esc>wa
imap <C-l> <Esc>:exec <Esc>A

" map control-space to auto-complete
inoremap <C-space> <C-x><C-o>

" buffer navigation
noremap <silent> [b :bprevious <CR>
noremap <silent> ]b :bnext <CR>

""""""""""""""""""""""""
" Plugin Configuration "
""""""""""""""""""""""""

" NERDTree
"map <leader>n :execute 'NERDTreeToggle'<CR>

map <leader>e :Explore<CR>:set number<CR>
set path=$PWD/**
set suffixesadd=.js,.py,.c,.cpp,.json

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_show_hidden = 1

" ctags
set tags=./tags,tags

" Tagbar
let g:tagbar_usearrows = 1
map <leader>tb :TagbarToggle<CR>

" Rust-Tagbar
let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits,traits',
        \'i:impls,trait implementations',
    \]
    \}

" Rust-Racer
set hidden "Also it's worth turning on 'hidden' mode for buffers otherwise you need to save the current buffer every time you do a goto-definition"
let g:racer_cmd="/Users/pabloalonso/.vim/bundle/rust-racer.vim/target/release/racer"
let $RUST_SRC_PATH="/usr/local/bin"

" Vim-Airline
let g:airline#extensions#tabline#enabled = 1

" Key Mapping
"  :nmap - Display normal mode maps
"  :imap - Display insert mode maps
"  :vmap - Display visual and select mode maps
"  :smap - Display select mode maps
"  :xmap - Display visual mode maps
"  :cmap - Display command-line mode maps
"  :omap - Display operator pending mode maps

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" remap j and k to scroll by visual lines
nnoremap j gj
nnoremap k gk

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.js :call DeleteTrailingWS()
autocmd BufWrite *.rs :call DeleteTrailingWS()

" Deactivate arrow keys
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
