let mapleader=" "

" 开启语法高亮功能
syntax enable
" 允许用制定语法高亮配色代替默认
syntax on

" 把tab拓展为空格
set expandtab
" 将连续4个空格看作tab
set softtabstop=4
set tabstop=4
" set backspace=indent,eol,start	"use backspace to delete indent and line
" 设置格式化是的tab占用空格数量
set shiftwidth=4
set autoindent smartindent
" 使用鼠标
set mouse=nv 
" 剪切操作
" 一直与系统剪切板连接
" set clipboard+=unnamedplus

" 文件类型相关
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" 行号数字的显示方式
set number
set norelativenumber
" 高亮显示当前行列
set cursorline
set nocursorcolumn
" 禁止代码折行
set nowrap
"set wrapmargin=2
set showcmd
" vim自身命令行模式自动补全
set wildmenu
set textwidth=120
" 移动时相距上下边界的距离
set scrolloff=5
" 在状态栏显示行号
set ruler
" 禁止光标闪烁
set gcr=a:block-blinkon0
" 关闭preview窗口
set completeopt-=preview

" 开启实时搜索功能
set hlsearch
" 随着键入内容自动查询
set incsearch
exec "nohlsearch"
" 搜索时大小写不敏感
set ignorecase
" 有大写时就对小写敏感了，很聪明^_^
set smartcase
" 开启正则表达式匹配
set magic

set encoding=utf8
" 关闭兼容模式
set nocompatible

set autochdir   "auto chdir when edting file in different dirs
set nobackup    "default backup file format: original-file~
set undofile    "save undo info of last time's opening
set history=1000
" 如果行尾有多余的空格，显示为小方块
" set list
" set listchars=tab:»■
" set listchars=trail:■
set nolist

" <++++ 快捷键 ++++>

iabbrev rt return
iabbrev ,a &&
iabbrev ,o \|\|
iabbrev ,e ==
iabbrev ,n !=
iabbrev ,g >=
iabbrev ,l <=
iabbrev ,. ->
" autocmd Filetype cpp,c inoremap ,. ->

" 移动到行首和行尾
noremap <c-h> 0
noremap <c-l> $
onoremap <c-h> 0
onoremap <c-l> $
" 快速移动光标
noremap H 5h
noremap K 7k
noremap J 7j
noremap L 5l
noremap <C-u> gUaw
" 清除查询后的高亮
noremap <LEADER><CR> :nohlsearch<CR>

map s <nop>
map R :source $MYVIMRC<CR>
map S :w<CR>
map Q :q<CR>	
map <LEADER>q :q!<CR>

" 退出插入模式
inoremap jj <Esc>
inoremap <C-l> <Right>
inoremap <A-h> <Delete>

vnoremap ;; <Esc>

" 光标在窗口间的移动
map s; :set splitright<CR>:vsplit<CR>
map sk :set splitbelow<CR>:split<CR>

" 在窗口之间移动光标
map <LEADER>; <C-w>l
map <LEADER>j <C-w>h
map <LEADER>l <C-w>k
map <LEADER>k <C-w>j

" 改变窗口的大小
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>


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
map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

" open terminal in newvim
nnoremap <LEADER>t :set splitright<CR>:vsplit<CR>:term fish<CR>:vertical resize-15<CR>
tnoremap jj <C-\><C-N>

" <++++ 插件 ++++>

call plug#begin('~/.vim/plugged')

"<colorscheme>
" Plug 'vim-airline/vim-airline'
Plug 'liuchengxu/eleline.vim'
Plug 'morhetz/gruvbox'
Plug 'sickill/vim-monokai'
"<highlight>
Plug 'yggdroot/indentline'
Plug 'kien/rainbow_parentheses.vim'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'octol/vim-cpp-enhanced-highlight'
"<completion>
Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"<fast-edit>
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'nelstrom/vim-visual-star-search'
Plug 'vim-scripts/a.vim'
"<lint>
" Plug 'dense-analysis/ale'
"<nerd-tree>
Plug 'preservim/nerdtree'
Plug 'majutsushi/tagbar'
"<markdown>
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

call plug#end()

" ===
" === colorscheme
" ===

colorscheme gruvbox
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces
let g:indentLine_color_term = 239
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2

let g:semshi#error_sign = 0
let g:semshi#mark_selected_nodes = 0


" ===
" === Coc
" ===
function GoCoc()
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gD <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
endfunction

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

set laststatus=2

" Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

autocmd BufEnter :call GoCoc()
autocmd Filetype python nmap <LEADER>rn :Semshi rename<CR>
" autocmd FileType cpp,cxx,h,hpp,c let g:coc_suggest_disable = 1

" ===
" === UtilSnips
" ===
let g:UltiSnipsExpandTrigger=";<Tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsSnippetDirectories=["mysnippets"]

" ===
" === NERDTREE
" ===
"autocmd vimenter * NERDTree  "自动开启Nerdtree
"let g:NERDTreeWinSize = 25 "设定 NERDTree 视窗大小
"开启/关闭nerdtree快捷键
map <C-f> :NERDTreeToggle<CR>
"let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
"打开vim时如果没有文件自动打开NERDTree
autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"设置树的显示图标
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeIgnore = ['\.pyc$']  " 过滤所有.pyc文件不显示
"let g:NERDTreeShowLineNumbers=1  " 是否显示行号
let g:NERDTreeHidden=0     "不显示隐藏文件
"Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" ===
" === marddown-preview
" ===
"let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1
let g:instant_markdown_browser = "google-chrome-stable --new-window"
autocmd Filetype markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>d4li
autocmd Filetype markdown inoremap ,1 #<Space><Enter><Enter><++><Esc>2kA
autocmd Filetype markdown inoremap ,2 ##<Space><Enter><Enter><++><Esc>2kA
autocmd Filetype markdown inoremap ,3 ###<Space><Enter><Enter><++><Esc>2kA
autocmd Filetype markdown inoremap ,4 ####<Space><Enter><Enter><++><Esc>2kA

" ===
" === tagbar
" ===
nmap <C-t> :TagbarToggle<CR>


" ===
" === vim-easy-align
" ===
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
