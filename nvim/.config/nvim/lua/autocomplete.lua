-- https://github.com/ms-jpq/coq_nvim
-- Requires universal-ctags (from brew)
-- Ruby lsp: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#solargraph
-- Golang lsp: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#solargraph
-- Python lsp: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#pyright
-- Bash lsp: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#bashls
-- Cpp lsp: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#clangd
-- Rust lsp: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
local lsp = require "lspconfig"

lsp.gopls.setup{
    settings = {
        gopls =  {
            env = {
                GOOS="linux"
            }
        }
    }
}
lsp.solargraph.setup{}
lsp.pyright.setup{}
lsp.bashls.setup{}
lsp.clangd.setup{}
lsp.rust_analyzer.setup{}

-- Coq settings
vim.g.coq_settings = {
  auto_start = 'shut-up',
  keymap = {
    jump_to_mark = '<c-?>'
  },
  clients = {
    tabnine = {
      enabled = true
    }
  }
}

-- This will show the popup menu even if there's only one match (menuone),
-- prevent automatic selection (noselect) and prevent automatic text injection
-- into the current line (noinsert).
vim.o.completeopt = 'noinsert,menuone,noselect'

-- Suppress the annoying 'match x of y', 'The only match' and 'Pattern not found' messages
vim.o.shortmess = vim.o.shortmess .. 'c'

-- Use <TAB> and <S-Tab> for popup menu selection
vim.api.nvim_set_keymap('i', '<TAB>', 'pumvisible() ? "<C-n>" : "<TAB>"', { expr = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', { expr = true })

-- Language server config
-- Required for operations modifying multiple buffers like rename.
vim.o.hidden = true

-- Configure copilot
require("coq_3p") {
  { src = "copilot", short_name = "COP", accept_key = "<C-f>" }
}

require("diaglist").init({
    -- optional settings
    -- below are defaults
    debug = false,

    -- increase for noisy servers
    debounce_ms = 150,
})
