" https://github.com/ms-jpq/coq_nvim
" Requires universal-ctags (from brew)
" Ruby lsp: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#solargraph
" Golang lsp: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#solargraph
" Python lsp: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#pyright
" Bash lsp: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#bashls
" Cpp lsp: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#clangd
" Rust lsp: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
lua << EOF
    local lsp = require "lspconfig"

    lsp.gopls.setup{}
    lsp.solargraph.setup{}
    lsp.pyright.setup{}
    lsp.bashls.setup{}
    lsp.clangd.setup{}
    lsp.rust_analyzer.setup{}
EOF

let g:coq_settings = { 'auto_start': 'shut-up', 'keymap': { 'jump_to_mark': '<c-?>' }, 'clients': { 'tabnine': { 'enabled': v:true }}}

" This will show the popup menu even if there's only one match (menuone),
" prevent automatic selection (noselect) and prevent automatic text injection
" into the current line (noinsert).
set completeopt=noinsert,menuone,noselect

" Suppress the annoying 'match x of y', 'The only match' and 'Pattern not found' messages
set shortmess+=c

" Use <TAB> to select the popup menu:
inoremap <expr><TAB>  pumvisible() ? '<C-n>' : '<TAB>'
inoremap <expr><S-Tab> pumvisible() ? '<c-P>' : '<S-Tab>'

" Language server config
" Required for operations modifying multiple buffers like rename.
set hidden
