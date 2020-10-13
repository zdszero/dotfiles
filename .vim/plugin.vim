call plug#begin('~/.vim/plugged')

Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/edge'
Plug 'sainnhe/sonokai'
Plug 'sainnhe/forest-night'
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'mattn/emmet-vim'
Plug 'liuchengxu/vista.vim'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'sbdchd/neoformat'
Plug 'luochen1990/rainbow'
Plug 'kshenoy/vim-signature'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                COLOR                                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
" edge
let g:edge_style='aura' " edge aura default
let g:edge_transparent_background=0
let g:edge_enable_italic=0 " italic keywords
let g:edge_disable_italic_comment = 1
" gruvbox
let g:gruvbox_material_background = 'soft' " hard medium soft
let g:gruvbox_material_transparent_background=0
let g:gruvbox_material_enable_italic = 0
let g:gruvbox_material_disable_italic_comment = 1
" sonokai
let g:sonokai_style = 'maia' " maia shusia andromeda atlantis default
let g:sonokai_enable_italic = 0
let g:sonokai_disable_italic_comment = 1
" forest night
let g:forest_night_enable_italic = 1
let g:forest_night_disable_italic_comment = 1

" dark light
set background=dark

colorscheme forest-night

let g:rainbow_active = 1

let g:indentLine_char = '┆'
let g:indentLine_setConceal = 2
let g:indentLine_faster = 1
let g:indentLine_fileTypeExclude = ['startify', 'help', 'markdown', 'sh', 'vim', 'javascript', 'css', 'coc-explorer']
let g:indentLine_bufTypeExclude = ['help', 'terminal']
nmap <leader>ig :IndentLinesToggle<CR>

let g:lightline = {
\ 'colorscheme': 'forest_night',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'filename', 'readonly', 'modified', 'gitbranch' ,'cocstatus' ] ]
\ },
\ 'component_function': {
\   'cocstatus': 'coc#status',
\   'gitbranch': 'FugitiveHead'
\ },
\ 'separator': { 'left': '', 'right': '' },
\ 'subseparator': { 'left': '', 'right': '' }
\ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 COC                                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction

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
  \ 'coc-lists',
  \ 'coc-bookmark',
  \ 'coc-actions']

let g:coc_filetype_map = {
  \ 'jst': 'html',
  \ 'h': 'c',
  \ 'hpp': 'cpp'
  \ }

let g:coc_explorer_global_presets = {
\   'floating': {
\      'position': 'floating'
\   },
\   'simplify': {
\     'file-child-template': '[git | 2] [selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ } 

" coc general mapping
nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>rn <Plug>(coc-rename)
nmap <silent> <leader>h :call CocAction('doHover')<cr>
" nmap <silent> <leader>x <Plug>(coc-codelens-action)
nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "F"
nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"
" goto coc-lists
nnoremap <silent> gl :CocList --number-select<CR>
" goto buffers
nnoremap <silent> sb :CocList buffers<CR>
" search files in current dir
nnoremap <silent> sf :CocList files<CR>
" search lines in current file
nnoremap <silent> sl :CocList lines<CR>
" search symbols
nnoremap <silent> ss :CocList symbols<CR>
" search words
nnoremap <silent> sw :CocList words<CR>
" coc snippet mapping
inoremap <silent><expr> <TAB>
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ "\<TAB>"
inoremap <silent><expr> <c-z> coc#refresh()
inoremap <silent><expr> <cr>
      \ pumvisible() ? coc#_select_confirm() :
      \ "\<cr>"
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'
vmap <C-a> <Plug>(coc-snippets-select)
xmap <leader>x <Plug>(coc-convert-snippet)
" coc explorer mapping
nmap <silent> <leader>e :CocCommand explorer --sources file+ --preset simplify --quit-on-open<CR>
" coc bookmark mapping
nmap <c-b>b <Plug>(coc-bookmark-toggle)
nmap <c-b>j <Plug>(coc-bookmark-next)
nmap <c-b>k <Plug>(coc-bookmark-prev)
nmap <c-b>a <Plug>(coc-bookmark-annotate)
nmap <c-b>/ :CocList bookmark<CR>
nmap <silent> <c-b>c :CocCommand bookmark.clearForCurrentFile<CR>
nmap <silent> <c-b>C :CocCommand bookmark.clearForAllFiles<CR>
" coc action
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

augroup CocOptions
  autocmd!
  autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 OI   :call CocAction('runCommand', 'editor.action.organizeImport')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             VIM-EASY-ALIGN                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             VIM-EASY-MOTION                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_smartcase = 1
map <c-w> <Plug>(easymotion-bd-w)
map <c-e> <Plug>(easymotion-bd-f)
map sj <Plug>(easymotion-j)
map sk <Plug>(easymotion-k)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   ALE                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" when to lint
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 1
let g:ale_linters = {
\   'python': ['pylint'],
\   'c++': ['gcc'],
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
" show detail
nmap <Leader>d :ALEDetail<CR>
" error sign
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚡'
let g:ale_sign_column_always = 0
let g:ale_fix_on_save = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  NEOFORMAT                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>f :Neoformat<cr>
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
"                                GITGUTTER                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_max_signs = 500
let g:gitgutter_max_signs = -1
let g:gitgutter_map_keys = 0
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                VISTA                                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_close_on_jump=0
