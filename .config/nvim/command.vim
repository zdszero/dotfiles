command! -nargs=? EV call EV#Commander(<f-args>)

command! PrintRTP call printer#PrintRTP()

command! MoveTab call MoveWindowToTab()
command! ChangeTab call ChangeTabSize()

command! Go execute '!chromium %'

autocmd BufEnter *.asm,*.s setf asm

augroup HtmlOptions
  autocmd!
  au BufEnter *.ejs set filetype=html
  au BufEnter *.ejs :syntax sync fromstart
  au BufEnter *.html :syntax sync fromstart
augroup END

augroup TabTwoSpaces
  autocmd!
  autocmd FileType c,cpp,vim,sh,html,javascript,json,scheme,lex,yacc set softtabstop=2
  autocmd FileType c,cpp,vim,sh,html,javascript,json,scheme,lex,yacc set tabstop=2
  autocmd FileType c,cpp,vim,sh,html,javascript,json,scheme,lex,yacc set shiftwidth=2
augroup END

function! ChangeTabSize() abort
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

function! MoveWindowToTab () abort
  let l:bufname = bufname()
  close
  exe 'tabnew ' . l:bufname
endfunction

let g:input_toggle = 0
function! Fcitx2en()
   let s:input_status = system("fcitx5-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx5-remote -c")
   endif
endfunction

function! Fcitx2zh()
   let s:input_status = system("fcitx5-remote")
   if s:input_status != 2 && g:input_toggle == 1
      let l:a = system("fcitx5-remote -o")
      let g:input_toggle = 0
   endif
endfunction

" set timeoutlen=150
" set input method to en when leaving insert mode
autocmd InsertLeave * call Fcitx2en()
" reset original input method when entering insert mode
autocmd InsertEnter * call Fcitx2zh()
