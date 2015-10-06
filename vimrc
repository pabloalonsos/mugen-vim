if has('vim')
    " Allow all commands
    set nocompatible
endif

" Remap Leader to ','
let mapleader=","

" Vundle Setup
filetype off
set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'bling/vim-airline'
Bundle 'vim-scripts/asmM6502.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'mattn/emmet-vim'
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'othree/html5.vim'
Bundle 'w0ng/vim-hybrid'
Bundle 'pangloss/vim-javascript'
Bundle 'mxw/vim-jsx'
Bundle 'groenewege/vim-less'
Bundle 'plasticboy/vim-markdown'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-obsession'
Bundle 'phildawes/racer'
Bundle 'rust-lang/rust.vim'
Bundle 'derekwyatt/vim-scala'
Bundle 'garbas/vim-snipmate'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/tlib'
Bundle 'leafgarland/typescript-vim'

" Show status line always
set laststatus=2

" Highlight cursor line
set cursorline

" Allow folding
set foldenable

" Fold by blocks
set foldmethod=syntax

" Fold nested blocks by default
set foldlevelstart=10

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
set hidden
nmap <leader>n :enew<cr>
noremap <silent> [b :bprevious <CR>
noremap <silent> ]b :bnext <CR>

""""""""""""""""""""""""
" Plugin Configuration "
""""""""""""""""""""""""

" Syntastic
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_args = "--no-eslintrc --config ~/Code/eslintrc"
" use eslintrc in current directory. Else look upwards. Else use standard
autocmd FileType javascript let b:syntastic_checkers = findfile('./eslintrc', '.;') != '' ? ['eslint'] : ['standard']

" vim-jsx
let g:jsx_ext_required = 0

map <leader>e :Explore<CR>:set number<CR>
set path=$PWD/**
set suffixesadd=.js,.py,.c,.cpp,.json

" emmet
" let g:user_emmet_expandabbr_key = '<C-F>'

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.git|node_modules|\.sass-cache|bower_components|build|target|dist)$',
    \ 'file': '\.swp$'
    \ }

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
let g:racer_cmd="/Users/pabloalonso/.vim/bundle/rust-racer.vim/target/release/racer"
let $RUST_SRC_PATH="/usr/local/bin"

" Vim-Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

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

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.js :call DeleteTrailingWS()
autocmd BufWrite *.rs :call DeleteTrailingWS()
autocmd BufWrite *.c :call DeleteTrailingWS()
autocmd BufWrite *.cpp :call DeleteTrailingWS()

" Switch from relative to absolute line number
function! NumberToggle()
    set number
    if(&relativenumber == 1)
        set relativenumber!
    else
        set relativenumber
    endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

" Deactivate arrow keys
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

" nvim specific commands
if has('nvim')
    " Exit terminal mode with Esc
    :tnoremap <Esc> <C-\><C-n>
    " Use alt+hjkl to move around windows
    :tnoremap <A-h> <C-\><C-n><C-w>h
    :tnoremap <A-j> <C-\><C-n><C-w>j
    :tnoremap <A-k> <C-\><C-n><C-w>k
    :tnoremap <A-l> <C-\><C-n><C-w>l
    :nnoremap <A-h> <C-w>h
    :nnoremap <A-j> <C-w>j
    :nnoremap <A-k> <C-w>k
    :nnoremap <A-l> <C-w>l
else
endif
