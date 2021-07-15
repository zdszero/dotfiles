function! s:OpenPdfFile()
  let l:dir = expand('%:p:h')
  let l:filename = expand('%:p:t')
  let l:prefix = matchstr(l:filename, '\v\ze^.*\ze\.')
  let l:pdf_file = l:prefix . '.pdf'
  call jobstart('zathura ' . l:pdf_file, {'cwd': l:dir})
endfunction

command! OpenPdf call s:OpenPdfFile()
