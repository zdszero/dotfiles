let mapleader=" "

set nocompatible
syntax enable
syntax on
filetype on
filetype indent on
filetype plugin on

" expand tab to spaces
set expandtab
set softtabstop=4
set tabstop=4
" set backspace=indent,eol,start	"use backspace to delete indent and line
set shiftwidth=4

set autoindent smartindent
set laststatus=2
set noshowmode

" mouse enable
set mouse=nv 

set number
set norelativenumber
set cursorline
set nocursorcolumn
" set gcr=a:block

set showcmd
set wildmenu
set textwidth=80
set wrap
set wrapmargin=0
set scrolloff=5
set ruler

set hlsearch
set incsearch
exec "nohlsearch"
set ignorecase
set smartcase
set magic

set encoding=utf8

set autochdir
set nobackup
set undofile
set history=1000 
set nolist
" true color support
set termguicolors
