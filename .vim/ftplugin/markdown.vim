function! MakeMathBlock () range
  '<,'> s/[\x00-\xff]\+/$\0$/g
endfunction

function! DeleteMarkdownPicture () abort
  let l:path = matchstr(getline('.'), '\v\(\zs.*\ze\)')
  if l:path ==# ''
    return
  endif
  let l:opt = confirm('Are you sure you want to delete this picture?', "&Yes\n&No")
  if l:opt == 1
    silent execute '!rm ' . './' . l:path
    silent execute 'normal dd'
  endif
endfunction

function! VisualWordCount () range
  execute '!sed -n ' . a:firstline . ',' . a:lastline . 'p % | wc -w'
endfunction

set conceallevel=2
set textwidth=0

inoremap <c-;> <Esc>/<++><CR>:nohlsearch<CR>d4li
inoremap ;f <Esc>/<++><CR>:nohlsearch<CR>d4li
inoremap ;i ** <++><Esc>F*i
inoremap ;b **** <++><Esc>F*;i
inoremap ;n ****** <++><Esc>F*;;i
inoremap ;s ~~~~ <++><Esc>F~;i
inoremap ;t - [ ] 
inoremap ;h ------<Enter><Enter>
inoremap ;l [](<++>)<Esc>F]i
inoremap ;p ![](<++>)<Esc>F]i
inoremap ;c ```<Enter><++><Enter>```<Esc>kkA
inoremap ;v `` <++><Esc>F`i
inoremap ;m $$ <++><Esc>F$i
inoremap ;; $$$$ <++><Esc>F$;i
inoremap ;1 #<Space><Enter><Enter><++><Esc>2kA
inoremap ;2 ##<Space><Enter><Enter><++><Esc>2kA
inoremap ;3 ###<Space><Enter><Enter><++><Esc>2kA
inoremap ;4 ####<Space><Enter><Enter><++><Esc>2kA
inoremap ;5 #####<Space><Enter><Enter><++><Esc>2kA
inoremap ;6 ######<Space><Enter><Enter><++><Esc>2kA
nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
vnoremap <silent> <c-f> :call MakeMathBlock()<CR>
vnoremap <silent> <c-c> :call VisualWordCount()<CR>
nmap <silent> <leader>d :call DeleteMarkdownPicture()<CR>
