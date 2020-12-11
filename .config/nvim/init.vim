"# General Settings
set number	        " Show line numbers
set linebreak	        " Break lines at word (requires Wrap lines)
set showbreak=+++	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch	        " Highlight matching brace
set hlsearch	        " Highlight all search results
set smartcase	        " Enable smart-case search
set ignorecase	        " Always case-insensitive
set incsearch	        " Searches for strings incrementally
set autoindent	        " Auto-indent new lines
set expandtab	        " Use spaces instead of tabs
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	        " Enable smart-indent
set smarttab	        " Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab
set wildmenu            " Use wildmenu
set hid                 " Hide buffer when abandoned
set magic               " To make regexes better
set noerrorbells        " Get rid of annoying beeping
set t_vb=               " Get rid of more annoying beeping
set tm=500              " And yet more of it
set foldcolumn=1        " Some space for folds
set encoding=utf8       " use utf8 as standard encoding
set nobackup            " no backups that's what git is for
set nowb                " get rid of more files that clutters
set noswapfile          " don't need swapfiles for vim
set ruler	        " show row and column ruler information
set undolevels=1000	" number of undo levels
set backspace=indent,eol,start	" backspace behaviour

" Make the terminal vim nice when we run in x
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set standard clipboard as the vim clipboard
set clipboard=unnamedplus
"
" " shortcut to get rid of search highlights, always forget that this one is here
map <silent> <leader><cr> :noh<cr>
" Rewrite the file as sudo, useful because I forget to sudo vim first
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
" Return to last edit position when opening files 
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" Make 0 go to first non-space character (easier to hit than ^)
map 0 ^
" autocompletion on
let g:deoplete#enable_at_startup = 1
" Esc to get out of terminal mode
tnoremap <Esc> <C-\><C-n>
" set the leader key to something comfortable
let mapleader = ","

" Delete trailing white space on save, don't want that in our files
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

" ------------------------- 
" -- Plug packages stuff --
" -------------------------

" set folder for plug
call plug#begin('~/.vim/plugged')

"
" Plugin list:
"
" Rust support
Plug 'rust-lang/rust.vim'
" Use Tab for walking completions
Plug 'ervandew/supertab'
" Personal wiki for vim
Plug 'vimwiki/vimwiki'
" a set of sensible vim defaults
Plug 'tpope/vim-sensible'
" Linting with languageserver
Plug 'dense-analysis/ale'
" Colourscheme
Plug 'junegunn/seoul256.vim'
" Fuzzy search, always good
Plug 'junegunn/fzf'
" Support for F#
Plug 'ionide/Ionide-vim', {
      \ 'do':  'make fsautocomplete',
      \}
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'ionide/Ionide-vim'
" Rainbow brackets for easier navigation
Plug 'frazrepo/vim-rainbow'
" Show css colourtags in their color
Plug 'ap/vim-css-color'
" A nicer bottom bar for vim
Plug 'itchyny/lightline.vim'
" Automatically insert closing pairs brackets etc.
Plug 'jiangmiao/auto-pairs'
" Display function signatures in command line
Plug 'Shougo/echodoc.vim'
" Some nice colorschemes for vim
Plug 'rafi/awesome-vim-colorschemes'
" nice functions for wrapping text objects
Plug 'tpope/vim-surround'
" completions
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" text objects for python
Plug 'jeetsukumaran/vim-pythonsense'
" LSP symbol browser
Plug 'liuchengxu/vista.vim'
" Eysy commenting
Plug 'tpope/vim-commentary'
call plug#end()

" 
" Plugin section end
"
" turn supertab completion around
let g:SuperTabDefaultCompletionType = "<c-n>"

"make lightline stick out less
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

" Set filestuff after loading plugins
syntax enable
filetype plugin on  "autoload plugins for files
filetype indent on

" I have no clue why this has to be in the end,
" but it doesn't like being farther up
colorscheme nord

