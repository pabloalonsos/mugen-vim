if has('vim')
    " Allow all commands
    set nocompatible
endif

" Remap Leader to ','
let mapleader=","

" Allow python in neovim
let g:python_host_prog='/usr/local/bin/python2.7'

" Vundle Setup
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ensime/ensime-vim'
Plugin 'neilagabriel/vim-geeknote'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'deraen/vim-cider'
Plugin 'derekwyatt/vim-scala'
Plugin 'garbas/vim-snipmate'
Plugin 'gmarik/vundle'
Plugin 'groenewege/vim-less'
Plugin 'guns/vim-clojure-highlight'
Plugin 'guns/vim-clojure-static'
Plugin 'jceb/vim-orgmode'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'kien/ctrlp.vim'
Plugin 'luochen1990/rainbow'
Plugin 'leafgarland/typescript-vim'
Plugin 'majutsushi/tagbar'
Plugin 'marcWeber/vim-addon-mw-utils'
Plugin 'mattn/emmet-vim'
Plugin 'mhartington/oceanic-next'
Plugin 'moll/vim-node'
Plugin 'mxw/vim-jsx'
" Plugin 'neilagabriel/vim-geeknote'
Plugin 'othree/html5.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'phildawes/racer'
Plugin 'plasticboy/vim-markdown'
Plugin 'rking/ag.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-obsession'
Plugin 'racer-rust/vim-racer'
Plugin 'tpope/vim-surround'
Plugin 'venantius/vim-eastwood'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/asmM6502.vim'
Plugin 'vim-scripts/tlib'
Plugin 'w0ng/vim-hybrid'
Plugin 'waiting-for-dev/vim-www'

call vundle#end()

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
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colorscheme OceanicNext
" colorscheme hybrid

" Set font
set guifont=Source\ Code\ Pro\ for\ Powerline\ Light:h12

" Syntax highlight
" syntax on

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

" No swap files
set noswapfile
" No trying to delete old backups
set nobackup
" No backups before overwriting file
set nowritebackup

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

inoremap `      ``<Left>
inoremap `<CR>  `<CR>`<Esc>O
inoremap ``     `

inoremap <      <><Left>
inoremap <<CR>  <<CR>><Esc>O
inoremap <<     <
inoremap <>     <>

imap <C-j> <Esc>:exec <Esc>wa
imap <C-l> <Esc>:exec <Esc>A

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

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
" let g:syntastic_javascript_eslint_args = "--no-eslintrc --config ~/Code/eslintrc"
" " use eslintrc in current directory. Else look upwards. Else use standard
" autocmd FileType javascript let b:syntastic_checkers = findfile('./eslintrc', '.;') != '' ? ['eslint'] : ['standard']

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
let g:ctrlp_custom_ignore = '\v[\/](\.git|node_modules|\.sass-cache|bower_components|build|target|dist)$'

" Use Ag as the default search engine for ctrlP
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" Always open files in new buffers
let g:ctrlp_switch_buffer = 0
" If project path has been changed through vim, change also ctrlP's
let g:ctrlp_working_path_mode = 0

" Ag
nnoremap \ :Ag<space>

" make vim grep use Ag
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap F :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

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
let g:racer_cmd="/Users/pabloalonso/.vim/bundle/racer/target/release/racer"
let $RUST_SRC_PATH="/Users/pabloalonso/.rust/src"

" Scala Ensime
"Typechecking after writing
autocmd BufWritePost *.scala silent :EnTypeCheck
"Easy Type Inspection
nnoremap <localleader>t :EnTypeCheck<CR>


" Vim-Airline
"let g:airline_theme='powerlineish'
let g:airline_theme='murmur'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" Rainbow Parentheses
 let g:rainbow_active = 1

 let g:rainbow_conf = {
             \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
             \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
             \   'operators': '_,_',
             \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
             \}

" Vim-Geeknote
" let g:GeeknoteNeovim="True"
" let g:GeeknoteFormat="markdown"

" Vim-www
let g:www_shortcut_engines = { 'devdocs': ['Devdocs']  }

"JavaScript syntax
let g:used_javascript_libs = 'underscore,angularjs,react,chai,lodash'

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

function! SpacesToggle()
    if(&tabstop == 4)
        set tabstop=2
        set shiftwidth=2
    else
        set tabstop=4
        set shiftwidth=4
    endif
endfunc

nnoremap <C-s> :call SpacesToggle()<cr>

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
