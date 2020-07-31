call plug#begin('~/.vim/plugged')

"<HIGHLIGHT>
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'
Plug 'kien/rainbow_parentheses.vim'
Plug 'sheerun/vim-polyglot'
"<COLORSCHEME>
Plug 'liuchengxu/eleline.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/edge'
Plug 'sainnhe/forest-night'
"<COMPLETION>
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"<FAST-EDIT>
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/vim-easy-align'
Plug 'nelstrom/vim-visual-star-search'
Plug 'mattn/emmet-vim'
"<CODE-HELP>
Plug 'majutsushi/tagbar'
Plug 'dense-analysis/ale'
Plug 'Chiel92/vim-autoformat'
Plug 'vimwiki/vimwiki'

call plug#end()

" ===
" === COLORSCHEME
" ===
set t_Co=256

" set background=dark
let g:edge_style='neon'
let g:edge_transparent_background=0
let g:forest_night_transparent_background=1
let g:gruvbox_material_transparent_background=0
let g:edge_enable_italic=1 " italic keywords
let g:gruvbox_material_enable_italic = 1
let g:forest_night_enable_italic = 1

colorscheme gruvbox-material

" === RAINBOW PARENTHESES
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces

" === INDENT GUIDE
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_tab_guides = 0
" let g:indent_guides_guide_size = 1
" let g:indent_guides_start_level = 2
" let g:indent_guides_exclude_filetypes = ['help', 'term', 'sh', 'vim', 'coc-explorer']

" === INDENT LINE
let g:indentLine_char = '┊'
let g:indentLine_setConceal = 1
let g:indentLine_fileTypeExclude = ['sh', 'vim', 'javascript', 'css', 'coc-explorer']
let g:indentLine_bufTypeExclude = ['help', 'terminal']
autocmd BufEnter *.wiki let g:indentLine_enabled=0
nmap <leader>ig :IndentLinesToggle<CR>

" ===
" === COC-GENERAL-SETTING
" ===

nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ "\<TAB>"
" use tab for completion
  " \ <SID>check_back_space() ? "\<TAB>" :
  " \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

 " Use <c-z> to trigger completion.
" inoremap <silent><expr> <c-z> coc#refresh()
" select the first completion item and confirm the completion when no item has been selected
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" close preview window when completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

set laststatus=2

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')

" Open Link
nmap <leader>O :call CocAction("openLink")

" ===
" === COC-SNIPPETS
" ===
imap ;<tab> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'
" imap <C-j> <Plug>(coc-snippets-expand-jump)

" ===
" === COC-EXPLORER
" ===

let g:coc_explorer_global_presets = {
\   'vim': {
\      'root-uri': '~/.config/nvim',
\   },
\   'floating': {
\      'position': 'floating',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\   },
\   'floatingLeftside': {
\      'position': 'floating',
\      'floating-position': 'left-center',
\      'floating-width': 50,
\   },
\   'floatingRightside': {
\      'position': 'floating',
\      'floating-position': 'left-center',
\      'floating-width': 50,
\  },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ } 

" open explorer
nmap <leader>e :CocCommand explorer<CR>
nmap <leader>b :CocCommand explorer --sources=buffer+ --preset floating<CR>

" ===
" === TAGBAR
" ===
nmap <C-t> :TagbarToggle<CR>

" ===
" === VIM-EASY-ALIGN
" ===
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ===
" === SIMPLY-FOLD
" ===
let g:SimpylFold_fold_import = 0

" ===
" === SNEAK
" ===
nmap ss <Plug>Sneak_s

" ===
" === ASYN-LINTER-MANAGER
" ===
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
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(ale_previous_wrap)
nmap <silent> ]g <Plug>(ale_next_wrap)
" show detail
nmap <Leader>d :ALEDetail<CR>
" error sign
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 0

" ===
" === AUTO FORMAT
" ===
nmap <leader>f :Autoformat<CR>

" ===
" === VIM WIKI
" ===
let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.nested_syntaxes = {'python': 'python', 'cpp': 'cpp', 'c': 'c'}
let g:vimwiki_list = [wiki]

" ===
" === EMMET
" ===
let g:user_emmet_mode='i'
