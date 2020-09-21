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
set laststatus=2

" mouse enable
set mouse=nv 

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set number
set norelativenumber
set cursorline
set nocursorcolumn
" set gcr=a:block

set nowrap
"set wrapmargin=2
set showcmd
set wildmenu
set textwidth=120
set scrolloff=5
set ruler

set hlsearch
set incsearch
exec "nohlsearch"
set ignorecase
set smartcase
set magic

set encoding=utf8
set nocompatible

set autochdir
set nobackup
set undofile
set history=1000
" set list
" set listchars=tab:»■
" set listchars=trail:■
set nolist
" true color support
set termguicolors
