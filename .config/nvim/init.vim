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

syntax enable
filetype plugin on  "autoload plugins for files
filetype indent on

" Make the terminal vim nice when we run in x
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" shortcut to get rid of search highlights, always forget that this one is here
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

Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/fzf'
Plug 'ionide/Ionide-vim', {
      \ 'do':  'make fsautocomplete',
      \}
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ionide/Ionide-vim'
Plug 'Shougo/echodoc.vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'tpope/vim-surround'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()

" 
" Plugin section end
"

"make lightline stick out less
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

" I have no clue why this has to be in the end,
" but it doesn't like being farther up
colorscheme nord
