call plug#begin('~/.config/nvim/plugged')

Plug 'mhinz/vim-startify'
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }
Plug 'kshenoy/vim-signature'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'sainnhe/edge'
Plug 'sheerun/vim-polyglot'
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'frazrepo/vim-rainbow', { 'for': ['racket', 'scheme'] }
Plug 'Yggdroot/indentLine', { 'for': 'python' }
Plug 'junegunn/goyo.vim', {'for': 'markdown'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim'
Plug 'junegunn/vim-easy-align'
Plug 'liuchengxu/vista.vim'
Plug 'dense-analysis/ale'
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
" edge
let g:edge_style='default' " edge aura default
let g:edge_transparent_background = 1
let g:edge_enable_italic = 0
let g:edge_disable_italic_comment = 0

let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1

" dark light
set background=dark

colorscheme edge

let g:indentLine_char = '┃'
let g:indentLine_setConceal = 2
let g:indentLine_faster = 1
let g:indentLine_bufTypeExclude = ['help', 'terminal']
nmap <leader>ig :IndentLinesToggle<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                LIGHTLINE                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! LightlineGit () abort
  return get(g:, 'coc_git_status')
endfunction

let g:lightline = {
\ 'colorscheme': 'edge',
\ 'active': {
\   'left': [
\     [ 'mode', 'paste' ],
\     [ 'filename', 'readonly', 'modified', 'gitbranch' ,'cocstatus', 'git' ] ],
\   'right': [ [ 'lineinfo' ],
\              [ 'percent' ],
\              [ 'fileformat', 'fileencoding', 'filetype' ],
\              [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ] ],
\ },
\ 'component_function': {
\   'cocstatus': 'coc#status',
\   'git': 'LightlineGit',
\   'linter_checking': 'lightline#ale#checking',
\   'linter_infos': 'lightline#ale#infos',
\   'linter_warnings': 'lightline#ale#warnings',
\   'linter_errors': 'lightline#ale#errors',
\   'linter_ok': 'lightline#ale#ok',
\ },
\ 'separator': { 'left': '', 'right': '' },
\ 'subseparator': { 'left': '', 'right': '' }
\ }

let g:lightline#ale#indicator_checking = "\uf110 "
let g:lightline#ale#indicator_infos = "\uf129 "
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "\uf00c "

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
      \ 'coc-texlab',
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
  \ 'hpp': 'cpp'
  \ }

let g:coc_explorer_global_presets = {
\   'wiki': {
\      'root-uri': '~/Documents/笔记本',
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
" nmap <silent> <leader>x <Plug>(coc-codelens-action)
nnoremap <expr> <C-d> coc#float#has_scroll() ? coc#util#float_scroll(1) : "\<C-d>"
nnoremap <expr> <C-u> coc#float#has_scroll() ? coc#util#float_scroll(0) : "\<C-u>"
" coc snippet mapping
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<cr>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
vmap <C-d> <Plug>(coc-snippets-select)
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

nmap <silent><expr> sf <SID>is_in_git_directory() ? ':GFiles<cr>' : ':Files<cr>'
nmap sb :Buffers<cr>
nmap sl :BLines<cr>
nmap sg :Rg<cr>
nmap st :HelpTags<cr>
nmap <leader>sg :exe 'Rg ' . expand('<cword>')<cr>
nmap ss :CocFzfList symbols<cr>
nmap sc :CocFzfList commands<cr>

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
"                                   ALE                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" when to lint
let g:ale_disable_lsp = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_linters = {
\   'python': ['pylint'],
\   'cpp': ['g++'],
\   'c': ['gcc'],
\   'sh': ['shell'],
\   'javascript': ['standard'],
\   'css': ['stylelint'],
\   'json': ['jsonlint'],
\}
let g:ale_css_stylelint_options = '--config ~/.stylelintrc'
nmap <silent> [g <Plug>(ale_previous_wrap)
nmap <silent> ]g <Plug>(ale_next_wrap)
nmap <silent> <leader>d :ALEDetail<cr>
" error sign
let g:ale_sign_error = '✕'
let g:ale_sign_warning = '⚡'
let g:ale_sign_column_always = 0
let g:ale_fix_on_save = 0
let g:ale_virtualtext_cursor = 0

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
let g:hugo_build_script_path = '~/Documents/博客/haha'

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
  autocmd FileType c,cpp setlocal formatprg=clang-format\ -style=Google\ --assume-filename=%
augroup END
let g:neoformat_enabled_python = ['autopep8']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                VIM-POLYGOT                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_auto_insert_bullets = 1
let g:vim_markdown_folding_disabled = 1
