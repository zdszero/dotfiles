let mapleader=" "

iabbrev rt return
iabbrev ,a &&
iabbrev ,o \|\|
iabbrev ,e ==
iabbrev ,n !=
iabbrev ,g >=
iabbrev ,l <=
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

function! OpenUrlInBrowser () abort
  let l:word = expand("<cWORD>")
  silent execute '!google-chrome-stable --app ' . l:word
  echo l:word . ' is open in chrome'
endfunction

nnoremap <silent> <leader>o :call OpenUrlInBrowser()<CR>

inoremap <s-cr> <cr><up>

" control
" normal and visual
noremap <c-h> 0
noremap <c-l> $
noremap <c-j> 7j
noremap <c-k> 7k
noremap <c-g> G
" operator pending
onoremap <c-h> 0
onoremap <c-l> $
" normal
nnoremap <c-s> :w<cr>
nnoremap <c-c> :CocConfig<cr>
nnoremap <c-q> <c-v>
" simulate uppercase command
nnoremap <c-a> A
noremap <c-i> I
noremap <c-o> O
nnoremap <c-p> P
nnoremap <c-v> V
nnoremap <c-f> F
nnoremap <c-w> W
nnoremap <c-e> E
nnoremap <c-b> B
nnoremap <c-y> yy
nnoremap <c-,> <<
nnoremap <c-.> >>
vnoremap <c-,> <
vnoremap <c-.> >
" use <c-m> <c-n> to jump forward and backwoard
nnoremap <c-m> <c-o>
nnoremap <c-n> <c-i>
" insert
inoremap <c-l> <esc>
inoremap <c-w> <esc>diwa
" emacs like key bindings
inoremap <c-f> <Right>
inoremap <c-b> <Left>
inoremap <c-a> &
inoremap <c-e> %
inoremap <c-p> *
inoremap <c-j> λ
inoremap <c-o> \|
inoremap <c-c> ^
inoremap <c-d> $
vmap <c-s> S

" shift
nnoremap V "+p
vnoremap C "+y

" alphabet
nnoremap s <nop>
nnoremap S :w<CR>
nnoremap U gUiw
nnoremap R :source $MYVIMRC<CR>
nnoremap Q :q<CR>	
nnoremap <LEADER>q :q!<CR>
nnoremap <leader><leader>q :qall<CR>
nnoremap <LEADER><CR> :nohlsearch<CR>

" split winodws vertically or horizontally
nnoremap s; :set splitright<CR>:vsplit<CR>
nnoremap s' :set splitbelow<CR>:split<CR>

" move cursor between windows
nnoremap <LEADER>; <C-w>l
nnoremap <LEADER>j <C-w>h
nnoremap <LEADER>l <C-w>k
nnoremap <LEADER>k <C-w>j

" resize
nnoremap <up> :res +5<CR>
nnoremap <down> :res -5<CR>
nnoremap <left> :vertical resize-5<CR>
nnoremap <right> :vertical resize+5<CR>

" tab
" switch between tabs
nnoremap [t :tabprevious<CR>
nnoremap ]t :tabnext<CR>
" switch between buffers
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap [B :bfirst<CR>
nnoremap ]B :blast<CR>
nnoremap [f <c-^>
nnoremap ]f <c-^>

" change the way windows are displayed
nnoremap sv <C-w>t<C-w>H
nnoremap sh <C-w>t<C-w>K
nnoremap se <C-w>r

" terminal
nnoremap <LEADER>t :set splitright<CR>:vsplit<CR>:term zsh<CR>:vertical resize-15<CR>:set nonumber<CR>:set norelativenumber<CR>:setlocal statusline=terminal<CR>:IndentLinesToggle<CR>
tnoremap <c-l> <C-\><C-N>
