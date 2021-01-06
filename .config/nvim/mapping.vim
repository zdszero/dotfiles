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
nnoremap <c-,> <<
nnoremap <c-.> >>
nnoremap <c-q> <c-v>
" simulate uppercase command
nnoremap <c-a> A
noremap <c-i> I
noremap <c-o> O
nnoremap <c-p> P
nnoremap <c-v> V
nnoremap <c-f> F
nnoremap <c-y> yy
nnoremap <c-[> {
nnoremap <c-]> }
nnoremap <c-9> (
nnoremap <c-0> )
nnoremap <c-8> *
nnoremap <c-3> #
" use <c-]> <c-[> to scroll forward and backwoard
nnoremap <c--> <c-f>
nnoremap <c-=> <c-b>
" use <c-m> <c-n> to jump forward and backwoard
nnoremap <c-m> <c-o>
nnoremap <c-n> <c-i>
" insert
inoremap <c-l> <esc>
inoremap <c-w> <esc>diwa
inoremap <expr> <c-j> pumvisible() ? "\<c-n>" : ""
inoremap <expr> <c-k> pumvisible() ? "\<c-p>" : "\<esc>O"
" emacs like key bindings
inoremap <c-f> <Right>
inoremap <c-b> <Left>
inoremap <c-a> &
inoremap <c-p> *
inoremap <c-o> \|
inoremap <c-c> ^
inoremap <c-d> $
" simulate shift mod
noremap <c-'> "
nnoremap <c-;> :
imap <c-[> {
imap <c-]> }
imap <c-7> &
imap <c-8> *
imap <c-9> (
imap <c-0> )
imap <c-{> )
imap <c-}> )
imap <c-,> <
imap <c-.> >
imap <c--> _
imap <c-=> +
imap <c-;> :
imap <c-'> "
imap <c-/> ?
imap <c-space> <space>
inoremap <c-h>a A
inoremap <c-h>b B
inoremap <c-h>c C
inoremap <c-h>d D
inoremap <c-h>e E
inoremap <c-h>f F
inoremap <c-h>g G
inoremap <c-h>h H
inoremap <c-h>i I
inoremap <c-h>j J
inoremap <c-h>k K
inoremap <c-h>l L
inoremap <c-h>m M
inoremap <c-h>n N
inoremap <c-h>o O
inoremap <c-h>p P
inoremap <c-h>q Q
inoremap <c-h>r R
inoremap <c-h>s S
inoremap <c-h>t T
inoremap <c-h>u U
inoremap <c-h>v V
inoremap <c-h>w W
inoremap <c-h>x X
inoremap <c-h>y Y
inoremap <c-h>z Z
inoremap <c-h>1 !
inoremap <c-h>2 @
inoremap <c-h>3 #
inoremap <c-h>4 $
inoremap <c-h>5 %
inoremap <c-h>6 ^
inoremap <c-h>7 &
inoremap <c-h>8 *
inoremap <c-h>9 (
inoremap <c-h>0 )
inoremap <c-h>- _
inoremap <c-h>- +
inoremap <c-h>[ {
inoremap <c-h>] }
inoremap <c-h>; :
inoremap <c-h>' "
inoremap <c-h>, <
inoremap <c-h>. >
inoremap <c-h>/ ?
inoremap <c-h>\ |
" visual
vnoremap <c-,> <
vnoremap <c-.> >
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

inoremap <C-w> <Tab>
