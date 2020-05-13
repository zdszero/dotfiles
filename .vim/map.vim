iabbrev rt return
iabbrev ,a &&
iabbrev ,o \|\|
iabbrev ,e ==
iabbrev ,n !=
iabbrev ,g >=
iabbrev ,l <=

" 移动到行首和行尾
noremap <c-h> 0
noremap <c-l> $
onoremap <c-h> 0
onoremap <c-l> $
" 快速移动光标
noremap <silent> H 5h
noremap <silent> K 7k
noremap <silent> J 7j
noremap <silent> L 5l
nnoremap \j 'Jj'
noremap <C-u> gUiw
" 清除查询后的高亮
noremap <LEADER><CR> :nohlsearch<CR>

nmap s <nop>
nmap R :source $MYVIMRC<CR>
nmap S :w<CR>
nmap Q :q<CR>	
nmap <LEADER>q :q!<CR>

" 退出插入模式
inoremap jj <Esc>
inoremap <C-l> <Right>
inoremap <C-a> <Left>
inoremap <A-h> <Delete>

vnoremap ;; <Esc>

" 光标在窗口间的移动
nnoremap s; :set splitright<CR>:vsplit<CR>
nnoremap sk :set splitbelow<CR>:split<CR>
nnoremap se <C-w>r

"在窗口之间移动光标
nnoremap <LEADER>; <C-w>l
nnoremap <LEADER>j <C-w>h
nnoremap <LEADER>l <C-w>k
nnoremap <LEADER>k <C-w>j

"改变窗口的大小
nnoremap <up> :res +5<CR>
nnoremap <down> :res -5<CR>
nnoremap <left> :vertical resize-5<CR>
nnoremap <right> :vertical resize+5<CR>


nnoremap tn :tabnew 
nnoremap tc :tabclose<CR>
" 在tab页面之间进行切换
nnoremap t; :tabnext<CR>
nnoremap tj :tabprevious<CR>
" 在buffer之间快速切换
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap [B :bfirst<CR>
nnoremap ]B :blast<CR>

" 改变窗口的排列方式
nnoremap sv <C-w>t<C-w>H
nnoremap sh <C-w>t<C-w>K

" open terminal in newvim
nnoremap <LEADER>t :set splitright<CR>:vsplit<CR>:term fish<CR>:vertical resize-15<CR>
tnoremap jj <C-\><C-N>
