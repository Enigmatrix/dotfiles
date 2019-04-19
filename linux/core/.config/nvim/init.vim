call plug#begin('~/.local/share/nvim/plugged')

" general
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neomake/neomake'
Plug 'haya14busa/incsearch.vim'
Plug 'mhinz/vim-startify'
Plug 'sheerun/vim-polyglot'
Plug 'hecal3/vim-leader-guide'
Plug 'SirVer/ultisnips'
Plug 'w0rp/ale'
Plug 'neomake/neomake'
Plug 'sheerun/vim-polyglot'
Plug 'vim-syntastic/syntastic'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }


"NERDTree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" markdown
Plug 'shime/vim-livedown'

" rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" toml
Plug 'cespare/vim-toml'

" python
Plug 'deoplete-plugins/deoplete-jedi'

" LaTex
Plug 'lervag/vimtex'

" TypeScript
Plug 'pangloss/vim-javascript'
Plug 'carlitux/deoplete-ternjs'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Quramy/tsuquyomi', { 'do': 'npm install -g typescript' }
Plug 'mhartington/deoplete-typescript'
Plug 'HerringtonDarkholme/yats.vim'

Plug 'ryanoasis/vim-devicons'

call plug#end()

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
nnoremap w <C-w>
" goodbye arrows
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>

" background
set termguicolors
set background=dark
colorscheme gruvbox

" ALE
" Error and warning signs.
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

" air-line
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_solarized_bg='dark'
"let g:airline_theme = 'solarized'
let g:airline_theme = 'gruvbox'


let g:fzf_colors = {
      \ 'fg':      ['fg', 'GruvboxGray'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'GruvboxRed'],
      \ 'fg+':     ['fg', 'GruvboxGreen'],
      \ 'bg+':     ['bg', 'GruvboxBg1'],
      \ 'hl+':     ['fg', 'GruvboxRed'],
      \ 'info':    ['fg', 'GruvboxOrange'],
      \ 'prompt':  ['fg', 'GruvboxBlue'],
      \ 'header':  ['fg', 'GruvboxBlue'],
      \ 'pointer': ['fg', 'Error'],
      \ 'marker':  ['fg', 'Error'],
      \ 'spinner': ['fg', 'Statement'],
      \ }

" nerdtree (only on directory open)
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


let g:deoplete#enable_at_startup = 1

"NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinPos = 'rightbelow'
let NERDTreeMinimalUI=1
let g:NERDTreeWinSize=get(g:,'NERDTreeWinSize',31)
let g:NERDTreeChDirMode=get(g:,'NERDTreeChDirMode',1)
let g:NERDTreeIgnore = ['\.git$', '\.DS_Store$']
let g:NERDTreeDirArrowExpandable = nr2char(8200)
let g:NERDTreeDirArrowCollapsible = nr2char(8200)
let NERDTreeShowHidden=1
autocmd VimEnter *
                \   if !argc()
                \ |   Startify
                \ |   NERDTree
                \ |   wincmd w
                \ | endif

" Deoplete settings
"
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
" call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])

let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:deoplete#sources#tss#javascript_support = 1
let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_auto_open = 1
let g:tsuquyomi_disable_quickfix = 1

" incremental search
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" startify
let g:ascii = [
            \ '__    __                      __        ______  _______   ________ ',
            \ '|  \  |  \                    |  \      |      \|       \ |        \',
            \ '| $$  | $$  ______    _______ | $$   __  \$$$$$$| $$$$$$$\| $$$$$$$$',
            \ '| $$__| $$ |      \  /       \| $$  /  \  | $$  | $$  | $$| $$__    ',
            \ '| $$    $$  \$$$$$$\|  $$$$$$$| $$_/  $$  | $$  | $$  | $$| $$  \   ',
            \ '| $$$$$$$$ /      $$| $$      | $$   $$   | $$  | $$  | $$| $$$$$   ',
            \ '| $$  | $$|  $$$$$$$| $$_____ | $$$$$$\  _| $$_ | $$__/ $$| $$_____ ',
            \ '| $$  | $$ \$$    $$ \$$     \| $$  \$$\|   $$ \| $$    $$| $$     \',
            \ ' \$$   \$$  \$$$$$$$  \$$$$$$$ \$$   \$$ \$$$$$$ \$$$$$$$  \$$$$$$$$',
            \ ''                                                                
          \]
let g:startify_custom_header =
    \ 'map(g:ascii, "\"   \".v:val")'

" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" UltiSnip
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/snippets']

""" Syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1


""" vim-devicons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_vimfiler = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_enable_flagship_statusline = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:webdevicons_enable_denite = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderPatternMatching = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1
let WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1
