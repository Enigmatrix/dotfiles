call plug#begin(stdpath('data') . '/plugged')

" Fuzzy Matching
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Visual Enhancements/ColorSchemes
"Plug 'ryanoasis/vim-devicons'

" Git Integration
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Vim Extensions
Plug 'mhinz/vim-startify'
Plug 'preservim/nerdcommenter'
Plug 'SirVer/ultisnips'

" Statusline/Bufferline
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
   
call plug#end()
   
" TODO searching options
" TODO keymap management
" TODO coc shortcuts
" TODO session/shada
" TODO git shortcuts
" TODO todo manager/tasks
   
" TODO get rid of termius autocomplete
   
" General
set splitbelow splitright       " Open new split below and to the right
set noequalalways               " Split close shouldn't change other split size
set fcs=eob:\                   " Hide tildes at end of file
set scrolloff=5                 " Keep at least 2 lines above/below
set sidescrolloff=7             " Keep at least 5 lines left/right
set showtabline=2               " Show tabline
set relativenumber                      " Enable line numbers

" History
set undofile swapfile backup  " enable undoing across vim sessions, saving and backing up
set directory=$DATA_PATH/swap//,$DATA_PATH,~/tmp,/var/tmp,/tmp
set undodir=$DATA_PATH/undo//,$DATA_PATH,~/tmp,/var/tmp,/tmp
set backupdir=$DATA_PATH/backup/,$DATA_PATH,~/tmp,/var/tmp,/tmp
set viewdir=$DATA_PATH/view/

" Searching
set ignorecase    " Search ignoring case
set smartcase     " Keep case when searching with *
set infercase     " Adjust case in insert completion mode
set incsearch     " Incremental search
set wrapscan      " Searches wrap around the end of the file

" Tabs and Indents
set tabstop=2       " The number of spaces a tab is
set softtabstop=2   " While performing editing operations
set shiftwidth=2    " Number of spaces to use in auto(indent)
set smarttab        " Tab insert blanks according to 'shiftwidth'
set autoindent      " Use same indenting on new lines
set smartindent     " Smart autoindenting on new lines
set shiftround      " Round indent to multiple of 'shiftwidth'
set expandtab       " Expand tabs to spaces

" NerdCommenter
let g:NERDSpaceDelims = 1       " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1   " Use compact syntax for prettified multi-line comments

" Colorscheme
set termguicolors
" colorscheme onedark
highlight Normal guibg=none ctermbg=none
highlight NonText guibg=none ctermbg=none

" Insert mode on terminal open
" autocmd BufEnter term://* startinsert
augroup TerminalStuff
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

" edit .vimrc/init.vim
augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
augroup END

" lightline
let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline = {
    \ 'colorscheme': 'onedark',
    \ 'active': {
    \   'left': [ ['mode', 'paste'], ['readonly', 'filename', 'modified'] ],
    \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'filetype' ], ['gitbranch'], ['coc_status'] ]
    \ },
    \ 'tabline': {
    \   'left': [ ['buffers'] ],
    \   'right': [ ['close'] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'BranchWithIcon',
    \   'coc_status': 'coc#status',
    \   'filetype': 'FiletypeWithIcon',
    \   'fileformat': 'FileformatWithIcon',
    \   'readonly': 'ReadonlyWithIcon'
    \ },
    \ 'component': {
    \   'lineinfo': 'î‚¡ %l:%v',
    \ },
    \ 'component_expand': {
    \   'buffers': 'lightline#bufferline#buffers'
    \ },
    \ 'component_type': {
    \   'buffers': 'tabsel'
    \ }
    \ }

function! ReadonlyWithIcon()
    return &readonly ? 'î‚¢' : ''
endfunction

function! FiletypeWithIcon()
  " return strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft'
  return &filetype
endfunction

function! FileformatWithIcon()
  return &fileformat . ' ' . WebDevIconsGetFileFormatSymbol()
endfunction

function! BranchWithIcon()
    let branch = FugitiveHead()
    return branch !=# '' ? 'î‚ '.branch : ''
endfunction

" COC
hi! link CocErrorSign WarningMsg
hi! link CocWarningSign Number
hi! link CocInfoSign Type
let g:coc_global_extensions = [
            \ "coc-json",
            \ "coc-explorer",
            \ "coc-docker",
            \ "coc-rust-analyzer",
            \ "coc-eslint",
            \ "coc-css",
            \ "coc-html",
            \ "coc-prettier",
            \ "coc-python",
            \ "coc-snippets",
            \ "coc-tsserver",
            \ "coc-ultisnips",
            \ "coc-tailwindcss",
            \ "coc-vetur"]

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

" FZF
let $FZF_DEFAULT_OPTS = '--layout=reverse'

" Neovide?
let g:neovide_refresh_rate=240
let g:neovide_anti=240
" let g:neovide_transparency=0.95
let g:neovide_cursor_vfx_mode=""
let g:neovide_cursor_animation_length=0
set guifont=JetbrainsMono\ Nerd\ Font:h13

" Startify
let g:startify_change_to_vcs_root = 1
 
" Fzf
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
 
command! -nargs=* -bang Search call RipgrepFzf(<q-args>, <bang>0)
 
" Key Mappings
let mapleader = "\<Space>"  " Use space key as leader
inoremap jk <Esc>           " jk instead of Esc key
" " vnoremap . :norm.<CR>
 
" nmap _ :Search<CR>
" nmap <leader><Space> :Files<CR>
" nmap <leader>e :CocCommand explorer<CR>
 
" " Better tabbing
" vnoremap < <gv
" vnoremap > >gv

" nmap <leader>h :sp<CR>
" nmap <leader>v :vsp<CR>

" nmap <leader>c :e $MYVIMRC<CR>
" nmap <leader>n :NERDTreeToggle<CR>
" " nmap <leader>t :10sp<CR>:ter<CR>i<CR>
" " exit from insert mode
" " tnoremap jk <C-\><C-n><CR>

" noremap <Up> <Nop>
" noremap <Down> <Nop>
" noremap <Left> <Nop>
" noremap <Right> <Nop>

" " Splits
" " Use alt + hjkl to resize windows
" nnoremap <M-j> :resize -2<CR>
" nnoremap <M-k> :resize +2<CR>
" nnoremap <M-h> :vertical resize -2<CR>
" nnoremap <M-l> :vertical resize +2<CR>
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" " halp
" nmap <leader>la  <Plug>(coc-codeaction)
" nmap <leader>lf  <Plug>(coc-fix-current)
" nmap <leader>lp :call CocAction('format')<CR>
" nmap <leader>lr :<C-u>CocCommand python.execInTerminal<CR>
" vmap <leader>lm :<C-u>CocCommand python.refactorExtractMethod<CR>
" nmap <leader>le  :<C-u>CocList diagnostics<CR>
" inoremap <silent><expr> <C-Space> coc#refresh()
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gt <Plug>(coc-type-defintion)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" nmap <silent> <F2> <Plug>(coc-rename)

" " Code Keymaps
" nnoremap <silent> <leader>d :call <SID>show_documentation()<cr>
" function! s:show_documentation()
  " if (index(['vim', 'help'], &filetype) >= 0)
    " execute 'h '.expand('<cword>')
  " else
    " call CocAction('doHover')
  " endif
" endfunction

" " buffer switching
" nnoremap <Tab> :bnext<CR>
" nnoremap <S-Tab> :bprevious<CR>
" nnoremap <C-X> :bdelete<CR>
" nmap <Leader>1 <Plug>lightline#bufferline#go(1)
" nmap <Leader>2 <Plug>lightline#bufferline#go(2)
" nmap <Leader>3 <Plug>lightline#bufferline#go(3)
" nmap <Leader>4 <Plug>lightline#bufferline#go(4)
" nmap <Leader>5 <Plug>lightline#bufferline#go(5)
" nmap <Leader>6 <Plug>lightline#bufferline#go(6)
" nmap <Leader>7 <Plug>lightline#bufferline#go(7)
" nmap <Leader>8 <Plug>lightline#bufferline#go(8)
" nmap <Leader>9 <Plug>lightline#bufferline#go(9)
" nmap <Leader>0 <Plug>lightline#bufferline#go(10)
