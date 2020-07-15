let mapleader=" "

syntax enable
syntax on

" expand tab to spaces
set expandtab
set softtabstop=4
set tabstop=4
" set backspace=indent,eol,start	"use backspace to delete indent and line
set shiftwidth=4

set autoindent smartindent

" 使用鼠标
set mouse=nv 

" 文件类型相关
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" 行号数字的显示方式
set number
set norelativenumber
" 高亮显示当前行，不显示列
set cursorline
set nocursorcolumn
" 任何时候都显示小方块
" set gcr=a:block

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

set hlsearch
set incsearch
exec "nohlsearch"
set ignorecase
set smartcase
" regex match
set magic

set encoding=utf8
set nocompatible

set autochdir
set nobackup
set undofile
set history=1000
" 如果行尾有多余的空格，显示为小方块
" set list
" set listchars=tab:»■
" set listchars=trail:■
set nolist
" true color support
set termguicolors
