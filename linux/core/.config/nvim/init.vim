" vim-plug auto setup
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

" ┌─────────┐
" │ Plugins │
" └─────────┘
call plug#begin('~/.local/share/nvim/plugged')

Plug 'gilsondev/searchtasks.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"Plug 'tomasiser/vim-code-dark'
"Plug 'mg979/vim-studio-dark'
Plug 'aswathkk/darkscene.vim'
Plug 'iCyMind/NeoSolarized'

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() }}
"Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'haya14busa/incsearch.vim'
Plug 'mhinz/vim-startify'

"Plug 'tpope/vim-unimpaired'
"Plug 'tpope/vim-surround'
"Plug 'tpope/vim-repeat'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'junegunn/goyo.vim'
Plug 'ryanoasis/vim-devicons'

"Plug 'zefei/vim-wintabs'
"Plug 'zefei/vim-wintabs-powerline'

call plug#end()
set pyxversion=3

" ┌──────────┐
" │ Settings │
" └──────────┘


" General

filetype plugin indent on
syntax on
set encoding=utf-8
set tabstop=2
set expandtab
set autoindent
set shiftwidth=2
set scrolloff=3
set showcmd
set hidden
set wildmenu
set visualbell
set splitbelow
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
set shortmess+=c

let g:loaded_clipboard_provider = 1

" background
if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
"set background=dark
"set t_Co=256
set t_ut=
colorscheme darkscene

au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme * hi NonText ctermbg=none guibg=none

" get rid of stupid tildes on blank line
"hi! EndOfBuffer ctermbg=234 ctermfg=234 guibg=#1e1e1e guifg=#1e1e1e
"hi! EndOfBuffer ctermbg=bg ctermfg=bg
" start in insert mode for terminal

augroup TerminalStuff
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END
" enable spell check in latex and markdown files
autocmd FileType latex,tex,md,markdown setlocal spell

let g:incsearch#auto_nohlsearch = 1

" edit .vimrc/init.vim
augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
augroup END

" air-line
let g:airline_powerline_fonts = 1
let g:airline_extensions = ['branch', 'hunks', 'coc', 'tabline']
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]
let g:airline_skip_empty_sections = 1
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
" Configure error/warning section to use coc.nvim
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

let g:airline#extensions#tabline#buffer_idx_format = {
      \ '0': '0 ',
      \ '1': '1 ',
      \ '2': '2 ',
      \ '3': '3 ',
      \ '4': '4 ',
      \ '5': '5 ',
      \ '6': '6 ',
      \ '7': '7 ',
      \ '8': '8 ',
      \ '9': '9 '
      \}

let g:airline_solarized_bg='dark'
"let g:airline_theme = 'solarized'
"let g:airline_theme = 'codedark'
let g:airline_theme = 'darkscene'


"let g:Vsd.contrast = 2  " high

" NERDTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinPos = 'rightbelow'
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Startify then NERDTree
autocmd VimEnter *
                \   if !argc()
                \ |   Startify
                \ |   NERDTree
                \ |   wincmd w
                \ | endif


" COC
hi! link CocErrorSign WarningMsg
hi! link CocWarningSign Number
hi! link CocInfoSign Type
let g:coc_global_extensions = ["coc-css",
            \ "coc-rls",
            \ "coc-docker",
            \ "coc-eslint",
            \ "coc-html",
            \ "coc-java",
            \ "coc-json",
            \ "coc-prettier",
            \ "coc-python",
            \ "coc-snippets",
            \ "coc-tslint",
            \ "coc-tsserver",
            \ "coc-ultisnips",
            \ "coc-tailwindcss",
            \ "coc-vetur"]

" UltiSnip
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/snippets']

" icons

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


" Startify
"
let g:startify_custom_header = [
            \ '       ______   __                  __     __  __               ',
            \ '      /      \ |  \                |  \   |  \|  \              ',
            \ '     |  $$$$$$\| $$   __  __    __ | $$   | $$ \$$ ______ ____  ',
            \ '     | $$___\$$| $$  /  \|  \  |  \| $$   | $$|  \|      \    \ ',
            \ '      \$$    \ | $$_/  $$| $$  | $$ \$$\ /  $$| $$| $$$$$$\$$$$\',
            \ '      _\$$$$$$\| $$   $$ | $$  | $$  \$$\  $$ | $$| $$ | $$ | $$',
            \ '     |  \__| $$| $$$$$$\ | $$__/ $$   \$$ $$  | $$| $$ | $$ | $$',
            \ '      \$$    $$| $$  \$$\ \$$    $$    \$$$   | $$| $$ | $$ | $$',
            \ '       \$$$$$$  \$$   \$$ _\$$$$$$$     \$     \$$ \$$  \$$  \$$',
            \ '                         |  \__| $$                             ',
            \ '                          \$$    $$                             ',
            \ '                           \$$$$$$                              ',
            \ ]

" fzf
let $FZF_DEFAULT_OPTS = '--layout=reverse'

"Open FZF and choose floating window
let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }

function! OpenFloatingWin()

  " 90% of the height
  let height = float2nr(&lines * 0.7)
  " 60% of the height
  let width = float2nr(&columns * 0.5)
  " horizontal position (centralized)
  let left = float2nr((&columns - width) / 2)
  let top = float2nr((&lines - height) / 2)

  "Set the position, size, etc. of the floating window.
  "The size configuration here may not be so flexible, and there's room for further improvement.
  let opts = {
        \ 'relative': 'editor',
        \ 'row': top,
        \ 'col': left,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }

  let top = "╭" . repeat("─", width - 2) . "╮"
  let mid = "│" . repeat(" ", width - 2) . "│"
  let bot = "╰" . repeat("─", width - 2) . "╯"
  let lines = [top] + repeat([mid], height - 2) + [bot]

  let s:buf = nvim_create_buf(v:false, v:true)
  call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
  call nvim_open_win(s:buf, v:true, opts)
  set winhl=Normal:Normal
  let opts.row += 1
  let opts.height -= 2
  let opts.col += 2
  let opts.width -= 4
  call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
  au BufWipeout <buffer> exe 'bw '.s:buf

  setlocal
        \ buftype=nofile
        \ nobuflisted
        \ bufhidden=hide
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction


let g:wintabs_ui_buffer_name_format = " %o %t "
let g:wintabs_display = 'tabline'

" ┌──────────────┐
" │ Key Mappings │
" └──────────────┘

let mapleader = "\<Space>"
inoremap jk <Esc>
nmap qq :q!<CR>
vnoremap . :norm.<CR>
nnoremap w <C-w>
nmap <leader>h :sp<CR>
nmap <leader>v :vsp<CR>
"nmap _ :DeniteProjectDir file/rec -split=floating -winrow=1<CR>
"nmap <leader>g Denite grep:::!<CR>

nmap _ :Rg<CR>
nmap <leader>f :Files<CR>

nmap <leader>c :e $MYVIMRC<CR>
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>t :10sp<CR>:ter<CR>i<CR>
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
" exit from insert mode
tnoremap jk <C-\><C-n><CR>
nmap <leader>la  <Plug>(coc-codeaction)
nmap <leader>lf  <Plug>(coc-fix-current)
nmap <leader>lp :call CocAction('format')<CR>
nmap <leader>lr :<C-u>CocCommand python.execInTerminal<CR>
vmap <leader>lm :<C-u>CocCommand python.refactorExtractMethod<CR>
nmap <leader>le  :<C-u>CocList diagnostics<CR>
inoremap <silent><expr> <C-Space> coc#refresh()
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <F2> <Plug>(coc-rename)
" buffer switching
nmap <Tab> <Plug>AirlineSelectPrevTab
nmap <S-Tab> <Plug>AirlineSelectNextTab
nnoremap <C-X> :bdelete<CR>
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
