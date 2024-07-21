-- https://github.com/ms-jpq/coq_nvim
-- Requires universal-ctags (from brew)
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local lsp = require "lspconfig"
local coq = require "coq"

lsp.gopls.setup{
  settings = {
    gopls =  {
      env = {
        GOOS="linux"
      }
    }
  }
}
lsp.solargraph.setup(coq.lsp_ensure_capabilities({}))
lsp.pyright.setup(coq.lsp_ensure_capabilities({}))
lsp.bashls.setup(coq.lsp_ensure_capabilities({}))
lsp.clangd.setup(coq.lsp_ensure_capabilities({}))
lsp.rust_analyzer.setup(coq.lsp_ensure_capabilities({}))

-- JS/TS/CSS/etc, requires npm install [-g] @biomejs/biome
-- Maybe use instead of neoformat + ESLint + Prettier in the future
-- lsp.biome.setup(coq.lsp_ensure_capabilities({}))

-- TypeScript, requires `npm i -g typescript-language-server`
lsp.tsserver.setup(
  coq.lsp_ensure_capabilities({
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" }
  })
)

-- Linting engine for JavaScript / Typescript, requires `npm i -g vscode-langservers-extracted`
-- Try `mfussenegger/nvim-lint` instead if it doesn't work
lsp.eslint.setup(coq.lsp_ensure_capabilities{
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
lsp.html.setup(coq.lsp_ensure_capabilities({}))
-- Requires npm install -g emmet-ls
lsp.emmet_ls.setup(coq.lsp_ensure_capabilities({}))

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
