call plug#begin('~/.local/share/nvim/plugged')

Plug 'rakr/vim-one'
"Plug 'morhetz/gruvbox'
"Plug 'arcticicestudio/nord-vim'
Plug 'bluz71/vim-nightfly-guicolors'
Plug  'arzg/vim-colors-xcode'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() }}
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'mhinz/vim-startify'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'ryanoasis/vim-devicons'

call plug#end()

" Neo/vim Settings
" ===

set number " set number
set noshowmode " dont show the mode under the lightline


" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"let g:gruvbox_contrast_dark='hard'
"let g:gruvbox_italic=1
"colorscheme gruvbox


if has('vim_starting')
	set encoding=utf-8
	scriptencoding utf-8
endif

" Enables 24-bit RGB color in the TUI
if has('termguicolors')
	set termguicolors
endif

if has('clipboard')
	set clipboard& clipboard+=unnamedplus
endif

" }}}
" Tabs and Indents {{{
" ----------------
set expandtab       " Expand tabs to spaces.
set tabstop=2       " The number of spaces a tab is
set softtabstop=2   " While performing editing operations
set shiftwidth=2    " Number of spaces to use in auto(indent)
set smarttab        " Tab insert blanks according to 'shiftwidth'
set autoindent      " Use same indenting on new lines
set smartindent     " Smart autoindenting on new lines
set shiftround      " Round indent to multiple of 'shiftwidth'

" }}}
" Timing {{{
" ------
set timeout ttimeout
set timeoutlen=750  " Time out on mappings
set updatetime=400  " Idle time to write swap and trigger CursorHold
set ttimeoutlen=10  " Time out on key codes

" }}}
" Searching {{{
" ---------
set ignorecase      " Search ignoring case
set smartcase       " Keep case when searching with *
set infercase       " Adjust case in insert completion mode
set incsearch       " Incremental search
set wrapscan        " Searches wrap around the end of the file
set showmatch       " Jump to matching bracket
set matchpairs+=<:> " Add HTML brackets to pair matching
set matchtime=1     " Tenths of a second to show the matching paren
set cpoptions-=m    " showmatch will wait 0.5s or until a char is typed
set showfulltag     " Show tag and tidy search in completion
"set complete=.      " No wins, buffs, tags, include scanning

if exists('+inccommand')
	set inccommand=nosplit
endif
" }}}

let g:quantum_black=1
let g:quantum_italics=1

hi! Comment cterm=italic
colorscheme xcodedarkhc
set fcs=eob:\ 

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

" let g:airline_theme = 'nord'
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
            \ "coc-highlight",
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

" rofi
au BufNewFile,BufRead /*.rasi setf css


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
function! s:find_git_root()
    return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()
command! -bang -nargs=* PRg
  \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'dir': system('git rev-parse --show-toplevel 2> /dev/null')[:-2]}, <bang>0)



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

nmap _ :PRg<CR>
nmap <leader>f :ProjectFiles<CR>
nmap <leader>m :Maps<CR>

nmap <leader>c :e $MYVIMRC<CR>
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>t :10sp<CR>:ter<CR>i<CR>

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

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
