if exists('g:cpp_alter_loaded')
  finish
endif

let g:cpp_alter_loaded = 1

function! s:SourceOrHeaderFile() abort
  let filename = expand('%')
  let suffix = expand('%:e')
  let source_ext = ['cpp', 'cc', 'c']
  let header_ext = ['hpp', 'h']
  if index(source_ext, suffix) != -1
    for tmp in header_ext
      let target = substitute(filename, suffix, tmp, '')
      if file_readable(target)
        return target
      endif
    endfor
  elseif index(header_ext, suffix) != -1
    for tmp in source_ext
      let target = substitute(filename, suffix, tmp, '')
      if file_readable(target)
        return target
      endif
    endfor
  endif
endfunction

nmap <silent> [h :exe 'e ' . <SID>SourceOrHeaderFile()<CR>
command! V :exe 'vsplit ' . <SID>SourceOrHeaderFile()
command! T :exe 'tabedit ' . <SID>SourceOrHeaderFile()
