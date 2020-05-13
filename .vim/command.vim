command! -nargs=? EV call EV#Commander(<f-args>)

command! PrintRTP call printer#PrintRTP()

command! G execute '!google-chrome-stable %'

command! VG normal ggVG

augroup MarkdownShortcut
    autocmd!
    autocmd Filetype markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>d4li
    autocmd Filetype markdown inoremap ,1 #<Space><Enter><Enter><++><Esc>2kA
    autocmd Filetype markdown inoremap ,2 ##<Space><Enter><Enter><++><Esc>2kA
    autocmd Filetype markdown inoremap ,3 ###<Space><Enter><Enter><++><Esc>2kA
    autocmd Filetype markdown inoremap ,4 ####<Space><Enter><Enter><++><Esc>2kA
augroup END
