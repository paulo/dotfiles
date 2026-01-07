-- Coq settings. Must be set before loading the plugin.
vim.g.coq_settings = {
  auto_start = 'shut-up',
  keymap = {
    jump_to_mark = '<c-?>'
  }
}

-- https://github.com/ms-jpq/coq_nvim
-- Requires universal-ctags (from brew)
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local coq = require "coq"

vim.lsp.config('gopls', coq.lsp_ensure_capabilities({
  settings = {
    gopls =  {
      env = {
        GOOS="linux"
      }
    }
  }
}))

vim.lsp.config('solargraph', coq.lsp_ensure_capabilities({}))
vim.lsp.config('pyright', coq.lsp_ensure_capabilities({}))
vim.lsp.config('bashls', coq.lsp_ensure_capabilities({}))
vim.lsp.config('clangd', coq.lsp_ensure_capabilities({}))

-- JS/TS/CSS/etc, requires npm install [-g] @biomejs/biome
-- Maybe use instead of neoformat + ESLint + Prettier in the future
-- TypeScript, requires `npm i -g typescript-language-server`
vim.lsp.config('ts_ls',
  coq.lsp_ensure_capabilities({
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" }
  })
)

-- Linting engine for JavaScript / Typescript, requires `npm i -g vscode-langservers-extracted`
-- Try `mfussenegger/nvim-lint` instead if it doesn't work
vim.lsp.config('eslint', coq.lsp_ensure_capabilities{
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})

-- HTML/CSS/JSON, requires npm i -g vscode-langservers-extracted
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
vim.lsp.config('html', coq.lsp_ensure_capabilities({}))
-- Requires npm i -g @olrtg/emmet-language-server
vim.lsp.config('emmet_language_server', coq.lsp_ensure_capabilities({}))

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

require("diaglist").init({
    -- optional settings
    -- below are defaults
    debug = false,

    -- increase for noisy servers
    debounce_ms = 150,
})

-- LSP keybindings, from https://vonheikemen.github.io/devlog/tools/neovim-lsp-client-guide/
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local bufmap = function(mode, lhs, rhs)
      local opts = {buffer = event.buf}
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- You can find details of these function in the help page
    -- see for example, :help vim.lsp.buf.hover()

    -- Trigger code completion
    bufmap('i', '<C-Space>', '<C-x><C-o>')

    -- Display documentation of the symbol under the cursor
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

    -- Jump to the definition
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

    -- Jump to declaration
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

    -- Lists all the implementations for the symbol under the cursor
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

    -- Jumps to the definition of the type symbol
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

    -- Lists all the references
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

    -- Displays a function's signature information
    bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

    -- Renames all references to the symbol under the cursor
    bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

    -- Format current file
    bufmap('n', '<F3>', '<cmd>lua vim.lsp.buf.format()<cr>')

    -- Selects a code action available at the current cursor position
    bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
  end
})
