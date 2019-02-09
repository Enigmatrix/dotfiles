func! main#before() abort
  let g:vimfiler_ignore_pattern = '^\%(\.git\|\.DS_Store\)$'
endf

func! main#after() abort
  let g:vimfiler_ignore_pattern = '^\%(\.git\|\.DS_Store\)$'
endf
