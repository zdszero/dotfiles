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

augroup TabTwoFiles
    autocmd!
    autocmd FileType vim set softtabstop=2
    autocmd FileType vim set tabstop=2
    autocmd FileType vim set shiftwidth=2
augroup END

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
" 有大写时就对小写敏感
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
