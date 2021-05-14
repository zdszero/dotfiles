command! -nargs=? EV call EV#Commander(<f-args>)
command! PrintRTP call printer#PrintRTP()
command! MoveTab call util#MoveWindowToTab()
command! ChangeTab call util#ChangeTabSize()
command! Go execute '!google-chrome-stable %'

autocmd BufEnter *.asm,*.s setf asm
autocmd BufEnter *.sy setf c | :ALEDisableBuffer | :CocDisable

augroup HtmlOptions
  autocmd!
  au BufEnter *.ejs set filetype=html
  au BufEnter *.ejs :syntax sync fromstart
  au BufEnter *.html :syntax sync fromstart
augroup END

augroup TabTwoSpaces
  autocmd!
  autocmd FileType python set softtabstop=4 | set tabstop=4 | set shiftwidth=4
augroup END

augroup SpecialAbbr
  autocmd FileType javascript iabbrev ,e === | iabbrev ,n !==
  autocmd FileType python iabbrev ,a and | iabbrev ,o or
  autocmd FileType go iabbrev ,s :=
augroup END

autocmd FileType python imap <c-cr> :<cr>

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
