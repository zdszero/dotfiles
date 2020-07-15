command! -nargs=? EV call EV#Commander(<f-args>)

command! PrintRTP call printer#PrintRTP()

command! G execute '!google-chrome-stable %'

augroup MarkdownShortcut
  autocmd!
  autocmd Filetype markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>d4li
  autocmd Filetype markdown inoremap ,1 #<Space><Enter><Enter><++><Esc>2kA
  autocmd Filetype markdown inoremap ,2 ##<Space><Enter><Enter><++><Esc>2kA
  autocmd Filetype markdown inoremap ,3 ###<Space><Enter><Enter><++><Esc>2kA
  autocmd Filetype markdown inoremap ,4 ####<Space><Enter><Enter><++><Esc>2kA
  autocmd Filetype markdown inoremap ,5 #####<Space><Enter><Enter><++><Esc>2kA
  autocmd Filetype markdown inoremap ,6 ######<Space><Enter><Enter><++><Esc>2kA
augroup END

augroup WikiShortcut
  autocmd!
  autocmd BufEnter *.wiki inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>d4li
  autocmd BufEnter *.wiki inoremap ,1 =<space><++><space>=<Enter><Enter><++><Esc>2kI
  autocmd BufEnter *.wiki inoremap ,2 ==<space><++><space>==<Enter><Enter><++><Esc>2kI
  autocmd BufEnter *.wiki inoremap ,3 ===<space><++><space>===<Enter><Enter><++><Esc>2kI
  autocmd BufEnter *.wiki inoremap ,4 ====<space><++><space>====<Enter><Enter><++><Esc>2kI
  autocmd BufEnter *.wiki inoremap ,5 =====<space><++><space>=====<Enter><Enter><++><Esc>2kI
  autocmd BufEnter *.wiki inoremap ,6 ======<space><++><space>======<Enter><Enter><++><Esc>2kI
  autocmd BufEnter *.wiki inoremap ,b ** <++><Esc>F*i
  autocmd BufEnter *.wiki inoremap ,i __ <++><Esc>F_i
  autocmd BufEnter *.wiki inoremap ,s ~~~~ <++><Esc>F~;i
  autocmd BufEnter *.wiki inoremap ,l [[]] <++><Esc>F];i
  autocmd BufEnter *.wiki inoremap ,h ----<Enter><Enter>
  autocmd BufEnter *.wiki inoremap ,c {{{<Enter><++><Enter>}}}<Esc>2kA
  autocmd BufEnter *.wiki nmap <leader>wa :VimwikiAll2HTML<CR>
augroup END

augroup HTMLShortCut
  autocmd!
  au BufEnter *.ejs set filetype=html
  au BufEnter *.html :syntax sync fromstart
  au BufEnter *.ejs :syntax sync fromstart
augroup END

augroup TabTwoFiles
  autocmd!
  autocmd FileType vim,sh,html,javascript,jst set softtabstop=2
  autocmd FileType vim,sh,html,javascript,jst set tabstop=2
  autocmd FileType vim,sh,html,javascript,jst set shiftwidth=2
  " let g:indent_guides_enable_on_vim_startup = 0
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
