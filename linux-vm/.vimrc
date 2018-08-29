"Pathogen Plugin Management
execute pathogen#infect()

"Basic Stuff
filetype plugin indent on
syntax on
set encoding=utf-8
set tabstop=4
set expandtab
set autoindent
set nocompatible
set shiftwidth=4
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmenu
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set number
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set wrap
set linebreak
set nolist

"Key Mappings
inoremap jk <Esc>
vnoremap . :norm.<CR>
let mapleader = "\<Space>"

"Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_theme = 'solarized'

"Solarized Colorscheme
syntax enable
set background=dark
colorscheme solarized
