call plug#begin('~/.config/nvim/plugged')

Plug 'mhinz/vim-startify'
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }
Plug 'frazrepo/vim-rainbow', { 'for': ['racket', 'scheme'] }
Plug 'junegunn/goyo.vim', {'for': 'markdown'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'windwp/nvim-autopairs'
Plug 'liuchengxu/vista.vim', { 'on': 'Vista' }
Plug 'zdszero/nvim-hugo', { 'branch': 'main' }
Plug 'sbdchd/neoformat', { 'on': 'Neoformat' }
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'SirVer/ultisnips'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'norcalli/nvim-colorizer.lua', { 'for': ['vim', 'html', 'css', 'yml'] }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'RRethy/vim-illuminate'
Plug 'hoob3rt/lualine.nvim'
Plug 'marko-cerovac/material.nvim'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'ray-x/lsp_signature.nvim'
Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'lua', 'for': 'python' }

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                color                                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "verilog" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},               -- list of language that will be disabled
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
require('bufferline').setup{}

-- autopairs
local npairs = require('nvim-autopairs')

npairs.setup({
  disable_filetype = { "TelescopePrompt", "racket", "scheme"},
})

EOF

luafile ~/.config/nvim/statusline.lua

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                NVIM-TELESCOPE                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua << EOF
require('telescope').setup{
  defaults = {
    layout_config = {
      center = {
        preview_cutoff = 40
      },
      height = 0.75,
      horizontal = {
        preview_cutoff = 120,
        prompt_position = "bottom"
      },
      vertical = {
        preview_cutoff = 40
      },
      width = 0.8
    }
  }
}
EOF

function! s:is_in_git_directory()
  silent !git rev-parse --is-inside-work-tree
  if v:shell_error == 0
    return 1
  endif
  return 0
endfunction

nmap <silent> <expr> <leader>sf <SID>is_in_git_directory() ?
      \'<cmd>Telescope git_files theme=get_dropdown<cr>' : '<cmd>Telescope find_files theme=get_dropdown<cr>'
nmap <silent> <leader>sb <cmd>Telescope buffers theme=get_dropdown<cr>
nmap <silent> <leader>st <cmd>Telescope colorscheme theme=get_dropdown<cr>
nmap <silent> <leader>sl <cmd>Telescope current_buffer_fuzzy_find<cr>
nmap <silent> <leader>sg <cmd>Telescope live_grep<cr>
nmap <silent> <leader>sw <cmd>Telescope grep_string<cr>
nmap <silent> <leader>sc <cmd>Telescope commands<cr>
nmap <silent> <leader>sh <cmd>Telescope help_tags<cr>
nmap <silent> <leader>se <cmd>Telescope lsp_workspace_diagnostics<cr>
nmap <silent> <leader>sr <cmd>Telescope lsp_references<cr>

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
  autocmd FileType c,cpp setlocal formatprg=clang-format\ -style=Google\ --assume-filename=%
augroup END
let g:neoformat_enabled_python = ['autopep8']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                VIM-POLYGOT                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_auto_insert_bullets = 1
let g:vim_markdown_folding_disabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               NVIM-LSPCONFIG                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua << EOF
local nvim_lsp = require('lspconfig')

nvim_lsp["ccls"].setup {
  init_options = {
    compilationDatabaseDirectory = "build";
    index = {
      threads = 0;
    },
    clang = {
      excludeArgs = { "-frounding-math"} ;
    },
    cache = {
      directory = "/tmp/ccls";
    };
  };
  on_attach = function(client)
    -- [[ other on_attach code ]]
    require 'illuminate'.on_attach(client)
    require "lsp_signature".on_attach()
  end,
}

-- using the default config
local servers = { "pyright", "rust_analyzer", "tsserver", "rust_analyzer", "html", "vimls", "texlab"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = function(client)
      -- [[ other on_attach code ]]
      require "lsp_signature".on_attach()
      require 'illuminate'.on_attach(client)
    end,
  }
end

EOF

hi def link LspReferenceText CursorLine 
hi def link LspReferenceWrite CursorLine
hi def link LspReferenceRead CursorLine

nnoremap <expr> <c-n> pumvisible() ? "\<c-n>" : ":lua require'illuminate'.next_reference{wrap=true}<cr>"
nnoremap <expr> <c-p> pumvisible() ? "\<c-p>" : ":lua require'illuminate'.next_reference{reverse=true,wrap=true}<cr>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               NVIM-COMPE                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set shortmess+=c
set completeopt=menuone,noselect

lua << EOF

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = false;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = false;
    ultisnips = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')

-- skip it, if you use another global object
_G.MUtils= {}

vim.g.completion_confirm_key = ""
MUtils.completion_confirm=function()
  if vim.fn.pumvisible() ~= 0  then
    if vim.fn.complete_info()["selected"] ~= -1 then
      return vim.fn["compe#confirm"](npairs.esc("<cr>"))
    else
      return npairs.esc("<cr>")
    end
  else
    return npairs.autopairs_cr()
  end
end


remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})

EOF

function! s:show_documentation()
  if index(['vim', 'help'], &filetype) >= 0
    execute 'h ' . expand('<cword>')
  else
    execute 'lua vim.lsp.buf.hover()'
  endif
endfunction

" lsp
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>Telescope lsp_references<cr>
nnoremap <silent> gi <cmd>Telescope lsp_implementations<cr>
" code action
nnoremap <silent><leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>
" hover doc and scroll
nnoremap <silent> K :call <SID>show_documentation()<cr>
" rename
nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
" jump error
nnoremap <silent> [e <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> ]e <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <leader>d <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               ULTISNIPS                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsSnippetDirectories = ['ultisnips']
imap <silent><expr> <c-t> compe#complete()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               LUA-TREE                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>e <cmd>NvimTreeToggle<cr>
