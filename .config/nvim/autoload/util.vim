function! util#OpenInBrowser () abort
  let l:word = expand("<cWORD>")
  silent execute '!chromium --app ' . l:word
  echo l:word . ' is open in chrome'
endfunction

function! util#JumpToRightCurlyBrace () abort
  /}
  startinsert!
endfunction

function! util#ChangeTabSize() abort
  if &tabstop == 4
    set softtabstop=2
    set tabstop=2
    set shiftwidth=2
  else
    set softtabstop=4
    set tabstop=4
    set shiftwidth=4
  endif
  exe '%s/    /  /g'
endfunction

function! util#MoveWindowToTab () abort
  let l:bufname = bufname()
  close
  exe 'tabnew ' . l:bufname
endfunction
