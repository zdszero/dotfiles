call plug#begin('~/.vim/plugged')

Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
Plug 'liuchengxu/eleline.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/edge'
Plug 'sainnhe/forest-night'
Plug 'mhinz/vim-startify'
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

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                COLOR                                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
let g:edge_style='neon'
let g:edge_transparent_background=0
let g:forest_night_transparent_background=0
let g:gruvbox_material_transparent_background=0
let g:edge_enable_italic=1 " italic keywords
let g:gruvbox_material_enable_italic = 1
let g:forest_night_enable_italic = 1

colorscheme gruvbox-material

let g:indentLine_char = '┊'
let g:indentLine_setConceal = 2
let g:indentLine_fileTypeExclude = ['markdown', 'sh', 'vim', 'javascript', 'css', 'coc-explorer']
let g:indentLine_bufTypeExclude = ['help', 'terminal']
nmap <leader>ig :IndentLinesToggle<CR>

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
  \ 'coc-clangd',
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
nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"
nnoremap <silent> gl :CocList --number-select<CR>
nnoremap <silent> <leader>b :CocList buffers<CR>
nnoremap <silent> <leader>c :CocCommand<CR>
inoremap <silent><expr> <c-z> coc#refresh()
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <silent><expr> <s-cr> "\<C-g>u\<CR>"
" coc snippet mapping
imap ;<tab> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'
" coc explorer mapping
nmap <silent> <leader>e :CocCommand explorer --sources file+ --preset simplify --quit-on-open<CR>
" coc bookmark mapping
nmap bb <Plug>(coc-bookmark-toggle)
nmap bj <Plug>(coc-bookmark-next)
nmap bk <Plug>(coc-bookmark-prev)
nmap ba <Plug>(coc-bookmark-annotate)
nmap bs :CocList bookmark<CR>
nmap <silent> bc :CocCommand bookmark.clearForCurrentFile<CR>
nmap <silent> bC :CocCommand bookmark.clearForAllFiles<CR>
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
map w <Plug>(easymotion-bd-w)
map e <Plug>(easymotion-bd-f2)
map sf <Plug>(easymotion-bd-f)
map sj <Plug>(easymotion-j)
map sk <Plug>(easymotion-k)
map sh <Plug>(easymotion-linebackward)
map sl <Plug>(easymotion-lineforward)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   ALE                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" when to lint
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 1
" select linters
let g:ale_linters = {
\   'python': ['pylint'],
\   'c++': ['clangd'],
\   'c': ['clangd'],
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
nmap <silent> gk <Plug>(ale_previous_wrap)
nmap <silent> gj <Plug>(ale_next_wrap)
" show detail
nmap <Leader>d :ALEDetail<CR>
" error sign
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '⚠'
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  NEOFORMAT                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>f :NeoFormat<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 EMMET                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:user_emmet_mode='i'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                GITGUTTER                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_max_signs = 500  " default value (Vim < 8.1.0614, Neovim < 0.4.0)
let g:gitgutter_max_signs = -1   " default value (otherwise)
let g:gitgutter_map_keys = 0
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                VISTA                                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_close_on_jump=0
let g:vista_echo_cursor_strategy='floating_win'
