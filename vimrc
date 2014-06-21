
" Allow all commands
set nocp
set nocompatible

" Pathogen
call pathogen#infect()
call pathogen#helptags()

" Set colorscheme
colorscheme hybrid
set background=dark

" Syntax highlight
syntax on

" Turn on the WiLd menu
set wildmenu

"Always show current position
set ruler

" Set to auto read when a file is changed from the outside
set autoread

" Custom indentation based on type of file
filetype plugin indent on

" Show line numbers
set number

" Set tabs
set tabstop=4
set shiftwidth=4

" Use spaces instead of tabs
set expandtab

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


""""""""""""""""""""""""
" Plugin Configuration "
""""""""""""""""""""""""

" NERDTree
map <leader>n :execute 'NERDTreeToggle'<CR>

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
	
" Tagbar
let g:tagbar_usearrows = 1
map <leader>tb :TagbarToggle<CR>


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

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
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
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
