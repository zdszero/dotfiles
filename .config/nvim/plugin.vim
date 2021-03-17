call plug#begin('~/.config/nvim/plugged')

Plug 'mhinz/vim-startify'
Plug 'tweekmonster/startuptime.vim'
Plug 'kshenoy/vim-signature'
Plug 'itchyny/lightline.vim'
Plug 'frazrepo/vim-rainbow'
Plug 'maximbaz/lightline-ale'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/edge'
Plug 'sainnhe/forest-night'
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mattn/emmet-vim'
Plug 'liuchengxu/vista.vim'
Plug 'dense-analysis/ale'
Plug 'sbdchd/neoformat'
Plug 'zdszero/auto-pairs'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf'

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
" gruvbox
let g:gruvbox_material_background = 'soft' " hard medium soft
let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_enable_italic = 0
let g:gruvbox_material_disable_italic_comment = 0
" forest night
let g:forest_night_transparent_background = 0
let g:forest_night_enable_italic = 0
let g:forest_night_disable_italic_comment = 0

let g:AutoPairs_fileTypeExclude = ['scheme', 'racket']

" dark light
set background=dark

colorscheme edge

let g:indentLine_char = '┃'
let g:indentLine_setConceal = 2
let g:indentLine_faster = 1
let g:indentLine_fileTypeExclude = ['startify', 'help', 'markdown', 'sh', 'vim', 'javascript', 
      \'css', 'coc-explorer', 'c', 'cpp', 'zsh', 'scheme', 'racket', 'vista', 'yacc', 'lex']
let g:indentLine_bufTypeExclude = ['help', 'terminal']
nmap <leader>ig :IndentLinesToggle<CR>

au FileType racket,scheme call rainbow#load()

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
  \ 'coc-python',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-emmet',
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
\      'root-uri': '~/Wiki',
\      'position': 'floating'
\   },
\   'simplify': {
\     'file-child-template': '[git | 2] [selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]',
\     'width': 30
\   }
\ } 

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

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
" coc explorer mapping
nmap <silent> <leader>e :CocCommand explorer --sources file+ --preset simplify --quit-on-open<CR>
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
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
vmap <C-d> <Plug>(coc-snippets-select)
xmap <leader>x <Plug>(coc-convert-snippet)

" autocmd CompleteDone * if pumvisible() == 0 | pclose | endif

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

nmap <silent><expr> sf <SID>is_in_git_directory() ? ':GFiles<CR>' : ':Files<CR>'
nmap sb :Buffers<CR>
nmap sl :BLines<CR>
nmap sw :Windows<CR>
nmap sh :Helptags<CR>
nmap sg :Rg<CR>
nmap <leader>sg :exe 'Rg ' . expand('<cword>')<CR>
nmap ss :CocFzfList symbols<CR>
nmap sc :CocFzfList commands<CR>

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
\   'html': ['tidy'],
\   'css': ['stylelint'],
\   'json': ['jsonlint'],
\}
" fixers used
let g:ale_fixers = {
\   'javascript': ['standard'],
\}
let g:ale_css_stylelint_options = '--config ~/.stylelintrc'
let g:ale_python_pylint_options = '--extension-pkg-whitelist=pygame'
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(ale_previous_wrap)
nmap <silent> ]g <Plug>(ale_next_wrap)
nmap <silent> <leader>d :ALEDetail<CR>
" error sign
let g:ale_sign_error = '✕'
let g:ale_sign_warning = '⚡'
let g:ale_sign_column_always = 0
let g:ale_fix_on_save = 0
let g:ale_virtualtext_cursor = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  NEOFORMAT                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>f :Neoformat<cr>
autocmd FileType javascript nmap <leader>f :ALEFix<CR>
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
let g:neoformat_enabled_python = ['autopep8', 'yapf']
let g:neoformat_enabled_javascript = ['standard']
let g:neoformat_enabled_c = ['clangformat']
let g:neoformat_enabled_cpp = ['clangformat']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 EMMET                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:user_emmet_mode='i'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                VISTA                                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_close_on_jump=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                WILDFIRE                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <c-cr> <Plug>(wildfire-fuel)
