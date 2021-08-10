command! -nargs=? EV call EV#Commander(<f-args>)
command! Go silent exe '!google-chrome-stable %'

autocmd BufEnter *.asm,*.s setf asm
autocmd BufEnter *.sy setf c | :ALEDisableBuffer | :CocDisable

augroup TabOptions
   autocmd!
   autocmd FileType asm,python set softtabstop=4 | set tabstop=4 | set shiftwidth=4
augroup END

augroup HtmlOptions
  autocmd!
  autocmd BufEnter *.ejs set filetype=html
  autocmd FileType html syn region javaScript start=+<script\_[^>]*>+ keepend end=+</script\_[^>]*>+me=s-1 contains=@htmlJavaScript,htmlCssStyleComment,htmlScriptTag,@htmlPreproc
  autocmd FileType html syn sync match htmlHighlight groupthere javaScript "<script"
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
