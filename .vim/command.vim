command! -nargs=? EV call EV#Commander(<f-args>)

command! PrintRTP call printer#PrintRTP()

command! Go execute '!google-chrome-stable %'

augroup MarkDownOptions
  autocmd!
  autocmd Filetype markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>d4li
  autocmd FileType markdown inoremap ,i ** <++><Esc>F*i
  autocmd FileType markdown inoremap ,b **** <++><Esc>F*;i
  autocmd FileType markdown inoremap ,n ****** <++><Esc>F*;;i
  autocmd FileType markdown inoremap ,s ~~~~ <++><Esc>F~;i
  autocmd FileType markdown inoremap ,t - [ ] 
  autocmd FileType markdown inoremap ,h ------<Enter><Enter>
  autocmd FileType markdown inoremap ,l [](<++>)<Esc>F]i
  autocmd FileType markdown inoremap ,p ![](<++>)<Esc>F]i
  autocmd FileType markdown inoremap ,c ```<Enter><++><Enter>```<Esc>kkA
  autocmd FileType markdown inoremap ,v `` <++><Esc>F`i
  autocmd Filetype markdown inoremap ,1 #<Space><Enter><Enter><++><Esc>2kA
  autocmd Filetype markdown inoremap ,2 ##<Space><Enter><Enter><++><Esc>2kA
  autocmd Filetype markdown inoremap ,3 ###<Space><Enter><Enter><++><Esc>2kA
  autocmd Filetype markdown inoremap ,4 ####<Space><Enter><Enter><++><Esc>2kA
  autocmd Filetype markdown inoremap ,5 #####<Space><Enter><Enter><++><Esc>2kA
  autocmd Filetype markdown inoremap ,6 ######<Space><Enter><Enter><++><Esc>2kA
  autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
  autocmd FileType markdown set conceallevel=2
augroup END

augroup HTMLOptions
  autocmd!
  au BufEnter *.ejs set filetype=html
  au BufEnter *.ejs :syntax sync fromstart
  au BufEnter *.html :syntax sync fromstart
augroup END

augroup TabTwoSpaces
  autocmd!
  autocmd FileType vim,sh,html,javascript,json set softtabstop=2
  autocmd FileType vim,sh,html,javascript,json set tabstop=2
  autocmd FileType vim,sh,html,javascript,json set shiftwidth=2
augroup END

function! SetTabTwo () abort
  set softtabstop=2
  set tabstop=2
  set shiftwidth=2
endfunction

function! SetTabFour () abort
  set softtabstop=4
  set tabstop=4
  set shiftwidth=4
endfunction

command! Tab2 call SetTabTwo()
command! Tab4 call SetTabFour()
