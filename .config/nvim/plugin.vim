call plug#begin('~/.config/nvim/plugged')

Plug 'mhinz/vim-startify'
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }
Plug 'kshenoy/vim-signature'
Plug 'itchyny/lightline.vim'
Plug 'josa42/vim-lightline-coc'
Plug 'marko-cerovac/material.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'frazrepo/vim-rainbow', { 'for': ['racket', 'scheme'] }
Plug 'Yggdroot/indentLine', { 'for': 'python' }
Plug 'junegunn/goyo.vim', {'for': 'markdown'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim'
Plug 'junegunn/vim-easy-align'
Plug 'liuchengxu/vista.vim', {'on': 'Vista'}
Plug 'Raimondi/delimitMate'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf'
Plug 'zdszero/nvim-hugo'
Plug 'sbdchd/neoformat'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                COLOR                                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256

let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "verilog" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {"markdown"},               -- list of language that will be disabled
  },
}

-- oceanic darker
vim.g.material_style = 'darker'
vim.g.material_italic_comments = true
vim.g.material_italic_keywords = false
vim.g.material_italic_functions = false
vim.g.material_italic_variables = false
vim.g.material_contrast = true
vim.g.material_borders = false
vim.g.material_disable_background = false
--vim.g.material_custom_colors = { black = "#000000", bg = "#0F111A" }

-- Load the colorscheme
require('material').set()

EOF

let g:indentLine_char = '┃'
let g:indentLine_setConceal = 2
let g:indentLine_faster = 1
let g:indentLine_bufTypeExclude = ['help', 'terminal']
nmap <leader>ig :IndentLinesToggle<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                LIGHTLINE                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:lightline = {
  \ 'colorscheme': 'wombat',
  \   'active': {
  \     'left': [['mode', 'paste'], [  'filename', 'coc_info', 'coc_hints', 'coc_errors', 'coc_warnings', 'coc_ok' ], [ 'coc_status'  ]]
  \   }
  \ }

" register compoments:
call lightline#coc#register()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 COC                                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files
set nobackup
set nowritebackup

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunctio

let g:coc_global_extensions = [
      \ 'coc-sh',
      \ 'coc-pyright',
      \ 'coc-lua',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-tsserver',
      \ 'coc-vimlsp',
      \ 'coc-json',
      \ 'coc-highlight',
      \ 'coc-explorer',
      \ 'coc-snippets',
      \ 'coc-git']

let g:coc_filetype_map = {
  \ 'jst': 'html',
  \ 'h': 'c',
  \ 'hpp': 'cpp',
  \ 'zsh': 'sh'
  \ }

let g:coc_explorer_global_presets = {
\   'wiki': {
\      'root-uri': '~/Documents/Notebook',
\      'position': 'floating'
\   },
\   'snip': {
\      'root-uri': '~/.config/coc/ultisnips',
\      'position': 'floating'
\   },
\   'simplify': {
\     'file-child-template': '[git | 2] [selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]',
\     'width': 30
\   }
\ } 

command! NoteBook :CocCommand explorer --preset wiki --sources=file+
command! SnipDir :CocCommand explorer --preset snip --sources=file+

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<cr>
" coc explorer mapping
nmap <silent> <leader>e :CocCommand explorer --sources file+ --preset simplify --quit-on-open<cr>
" coc general mapping
nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>rn <Plug>(coc-rename)
" diagnostics
let g:ale_enabled = 0
nmap [e <plug>(coc-diagnostic-prev)
nmap ]e <plug>(coc-diagnostic-next)
" nmap <silent> <leader>x <Plug>(coc-codelens-action)
nnoremap <expr> <C-d> coc#float#has_scroll() ? coc#util#float_scroll(1) : "\<C-d>"
nnoremap <expr> <C-u> coc#float#has_scroll() ? coc#util#float_scroll(0) : "\<C-u>"
" coc snippet mapping
inoremap <silent><expr> <TAB>
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<cr>" :
      \ pumvisible() ? coc#_select_confirm() :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'
" xmap <tab> <Plug>(coc-snippets-select)
xmap <leader>x <Plug>(coc-convert-snippet)
" map func and class obj
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 OI   :call CocAction('runCommand', 'editor.action.organizeImport')

" navigate chunks of current buffer
nmap [h <Plug>(coc-git-prevchunk)
nmap ]h <Plug>(coc-git-nextchunk)
nmap <leader>st :CocCommand git.chunkStage<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                FZF-VIM                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:is_in_git_directory()
  silent !git rev-parse --is-inside-work-tree
  if v:shell_error == 0
    return 1
  endif
  return 0
endfunction

nmap <silent><expr> <leader>sf <SID>is_in_git_directory() ? ':GFiles<cr>' : ':Files<cr>'
nmap <leader>sb :Buffers<cr>
nmap <leader>sl :BLines<cr>
nmap <leader>sg :Rg<cr>
nmap <leader>sh :Helptags<cr>
nmap <leader>ss :CocFzfList symbols<cr>
nmap <leader>sc :CocFzfList commands<cr>
nmap <leader>sd :CocFzfList diagnostics<cr>

let g:coc_fzf_preview = ''
let g:coc_fzf_opts = []

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             VIM-EASY-ALIGN                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                VISTA                                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_close_on_jump=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                WILDFIRE                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map X <Plug>(wildfire-fuel)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                HUGO_NVIM                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:hugo_home_path = '~/Documents/博客'
let g:hugo_post_template = [
      \ '---',
      \ 'title: HUGO_TITLE',
      \ 'date: HUGO_DATE',
      \ 'tags: []',
      \ 'draft: true',
      \ '---',
      \ '' ]
let g:hugo_build_script_path = '~/Documents/博客/update_blog'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                NEOFORMAT                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>f :Neoformat<cr>
" format when ft is not specified
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1
" certain filetypes
let g:neoformat_try_formatprg = 1
augroup FmtType
  autocmd!
  autocmd FileType javascript,html setlocal formatprg=prettier\ --no-semi\ --single-quote\ --stdin-filepath\ %
  autocmd FileType c,cpp setlocal formatprg=clang-format\ -style=LLVM\ --assume-filename=%
augroup END
let g:neoformat_enabled_python = ['autopep8']
