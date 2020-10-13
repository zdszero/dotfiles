iabbrev rt return
iabbrev ,a &&
iabbrev ,o \|\|
iabbrev ,e ==
iabbrev ,n !=
iabbrev ,g >=
iabbrev ,l <=
autocmd FileType javascript iabbrev ,e ===
autocmd FileType javascript iabbrev ,n !==
autocmd FileType python iabbrev ,a and
autocmd FileType python iabbrev ,o or

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
" simulate uppercase command
nnoremap <c-a> A
noremap <c-i> I
noremap <c-o> O
nnoremap <c-p> P
nnoremap <c-v> V
nnoremap <c-y> yy
" use <c-]> <c-[> to scroll forward and backwoard
nnoremap <c-]> <c-f>
nnoremap <c-[> <c-b>
" use <c-m> <c-n> to jump forward and backwoard
nnoremap <c-m> <c-o>
nnoremap <c-n> <c-i>
" insert
inoremap <c-l> <esc>
inoremap <expr> <c-j> pumvisible() ? "\<c-n>" : "\<del>"
inoremap <c-k> <c-p>
" emacs like key bindings
inoremap <c-f> <Right>
inoremap <c-b> <Left>
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A
" visual
vnoremap <c-,> <
vnoremap <c-.> >

" shift
nnoremap V "+p
vnoremap C "+y

" alphabet
noremap s <nop>
noremap S :w<CR>
noremap U gUiw
noremap R :source $MYVIMRC<CR>
noremap Q :q<CR>	
noremap <LEADER>q :q!<CR>
noremap <leader><leader>q :bdelete %<CR>
noremap <LEADER><CR> :nohlsearch<CR>

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
nnoremap tc :tabclose<CR>
" switch between tabs
nnoremap t; :tabnext<CR>
nnoremap tj :tabprevious<CR>
" switch between buffers
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap [B :bfirst<CR>
nnoremap ]B :blast<CR>

" change the way windows are displayed
nnoremap sv <C-w>t<C-w>H
nnoremap sh <C-w>t<C-w>K
nnoremap se <C-w>r

" terminal
nnoremap <LEADER>t :set splitright<CR>:vsplit<CR>:term zsh<CR>:vertical resize-15<CR>:set nonumber<CR>:setlocal statusline=terminal<CR>:IndentLinesToggle<CR>
tnoremap <c-l> <C-\><C-N>

inoremap <C-w> <Tab>
