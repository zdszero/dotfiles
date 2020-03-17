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
set clipboard+=unnamedplus
let g:clipboard = {
      \   'name': 'myClipboard',
      \   'copy': {
      \      '+': 'xclip -i',
      \      '*': 'xclip -i',
      \    },
      \   'paste': {
      \      '+': 'xclip -o',
      \      '*': 'xclip -o',
      \   },
      \   'cache_enabled': 1,
      \ }

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
"set listchars=tab:»■,trail:■
"set nolist

" <++++ 快捷键 ++++>

iabbrev rt return
iabbrev ,a &&
iabbrev ,o \|\|
iabbrev ,e ==
iabbrev ,n !=
iabbrev ,g >=
iabbrev ,l <=
autocmd Filetype cpp,c inoremap ,. ->

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

" ex模式下进行选择
cnoremap <C-p> <Left>
cnoremap <C-n> <Right>

vnoremap <leader>; <esc>

" 光标在窗口间的移动
map sl :set splitright<CR>:vsplit<CR>
map sj :set splitbelow<CR>:split<CR>

" 在窗口之间移动光标
map <LEADER>l <C-w>l
map <LEADER>h <C-w>h
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j

" 改变窗口的大小
map <up> :res -5<CR>
map <down> :res +5<CR>
map <left> :vertical resize+5<CR>
map <right> :vertical resize-5<CR>

" 打开新的tab页面
map <LEADER>t :tabe<CR>
" 在tab页面之间进行切换
map tj :tabnext<CR>
map tk :tabprevious<CR>

" 改变窗口的排列方式
map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

" <++++ 插件 ++++>

call plug#begin('~/.vim/plugged')

"<colorscheme>
Plug 'connorholyday/vim-snazzy'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'kien/rainbow_parentheses.vim'
Plug 'sickill/vim-monokai'
Plug 'yggdroot/indentline'
"<auto-completion>
Plug 'ycm-core/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
"<nerd-tree>
Plug 'preservim/nerdtree'
"Plug 'jistr/vim-nerdtree-tabs'      " enhance nerdtree's tabs
"Plug 'ryanoasis/vim-devicons'       " add beautiful icons besides files
"Plug 'Xuyuanp/nerdtree-git-plugin'  " display git status within Nerdtree
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " enhance devicons
"<markdown>
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'dense-analysis/ale'

call plug#end()

" ===
" === colorscheme
" ===

" colorscheme snazzy
" colorscheme gruvbox
colorscheme monokai
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces
let g:indentLine_color_term = 239
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2

" ===
" === You Complete Me
" ===
nnoremap gd :YcmCompleter GoToDeclaration<CR>
nnoremap gf :YcmCompleter GoToDefinition<CR>
nnoremap g/ :YcmCompleter GetDoc<CR>
nnoremap gt :YcmCompleter GetType<CR>
nnoremap gr :YcmCompleter GoToReference<CR>

let g:ycm_python_interpreter_path="/usr/bin/python3"
let g:ycm_python_binary_path="/usr/bin/python3"
" 允许vim在ycm_extra_conf.py，不再提示
let g:ycm_confirm_extra_conf=0
let g:ycm_global_ycm_extra_conf="/home/zds/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py"

" C++ Completion
" 在顶层时按下触发语义补全
let g:ycm_key_invoke_completion = '<c-z>'
" 不使用YCM提供的诊断功能，有ale了
let g:ycm_show_diagnostics_ui = 0
let g:YcmShowDetailedDiagnostic=0
" 从第2个键入字符就开始罗列匹配项，为符号补全
let g:ycm_min_num_of_chars_for_completion=2
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1

let g:ycm_filetype_whitelist = { 
			\ "c":1,
			\ "cpp":1, 
            \ "python":1,
            \ "h":1,
			\ }


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
"let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
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
" === ale
" ===
" 只有保存时才运行Lint
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_save = 1
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0
"始终开启标志列
let g:ale_sign_column_always = 0
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
