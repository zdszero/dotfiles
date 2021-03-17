command! -nargs=? EV call EV#Commander(<f-args>)
command! PrintRTP call printer#PrintRTP()
command! MoveTab call util#MoveWindowToTab()
command! ChangeTab call util#ChangeTabSize()
command! Go execute '!chromium %'

autocmd BufEnter *.asm,*.s setf asm
autocmd BufEnter *.sy setf c
autocmd BufEnter *.sy :ALEDisableBuffer

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

augroup SpecialAbbr
  autocmd FileType javascript iabbrev ,e ===
  autocmd FileType javascript iabbrev ,n !==
  autocmd FileType python iabbrev ,a and
  autocmd FileType python iabbrev ,o or
  autocmd FileType go iabbrev ,s :=
augroup END

augroup BlockCR
  autocmd FileType c,cpp,javascript imap <c-cr> {<cr>
  autocmd FileType python imap <c-cr> :<cr>
augroup END

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
