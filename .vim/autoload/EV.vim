function EV#Commander(...) abort
  " if no parameters, edit vimrc
  if a:0 == 0
    edit $MYVIMRC
    return 0
  endif

  let l:arg = a:1

  " option
  if l:arg == 'o'
    edit ~/.vim/option.vim
    return 1
  endif

  " map
  if l:arg == 'm'
    edit ~/.vim/map.vim
    return 1
  endif

  " plugin config
  if l:arg == 'p'
    edit ~/.vim/plug.vim
    return 1
  endif

  " commands
  if l:arg == 'c'
    edit ~/.vim/command.vim
    return 1
  endif

  " edit ultisnips
  if l:arg == 's'
    execute 'CocCommand snippets.editSnippets'
    return 1
  endif

  " edit file
  if filereadable(l:arg)
    execute 'edit ' . l:arg
    return 1
  endif

  " edit file in RTP
  let l:path = s:FindInRTP(l:arg)
  if len(l:path) > 0
    execute 'edit ' . l:path
    return 1
  endif

  echo 'cannot find file ' . l:arg
endfunction

" return the whole path of file if file is in RTP
" else ''
function s:FindInRTP (file) abort
  let l:rtps = split(&rtp, ',')
  for l:rtp in l:rtps

    let l:path = l:rtp . '/' . a:file
    if filereadable(l:path)
      return l:path
    endif

    let l:path = l:rtp . '/' . a:file . '.vim'
    if filereadable(l:path)
      return l:path
    endif

    let l:path = l:rtp . '/plugin/' . a:file
    if filereadable(l:path)
      return l:path
    endif

    let l:path = l:rtp . '/plugin/' . a:file . '.vim'
    if filereadable(l:path)
      return l:path
    endif

  endfor
  return ''
endfunction
