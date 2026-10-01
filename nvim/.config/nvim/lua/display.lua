-- Number display
vim.opt.relativenumber = true
vim.opt.number = true

-- Customize how diagnostics are displayed
-- From https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization
vim.diagnostic.config({
    virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = ' ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
        numhl = { -- number highlighting
            [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
            [vim.diagnostic.severity.WARN] = 'WarningMsg',
        },
    },
})

-- Show vim diagnostics in a floating window instead of inline
-- From https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#show-line-diagnostics-automatically-in-hover-window
vim.o.updatetime = 250
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = true,
      prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end
})

-- Performance improvement for indenting lines
-- vim.g.indentLine_faster = 1
vim.g.indentLine_setConceal = 0

-- Show text wrap on the line number
vim.opt.showbreak = ' ↳ '

-- Open new split panes to right and bottom
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Disable auto indent due to issue related to big files
-- vim.cmd('autocmd fileType ruby,vim indent off')

-- Tag management (displays all file tags)
-- vim.api.nvim_set_keymap('n', '<F8>', ':TagbarToggle<CR>', { noremap = true })

require("tree-sitter-manager").setup({
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "css", "bash", "cpp", "dockerfile", "elixir", "git_config", "git_rebase", "gitcommit", "go", "gomod", "gosum", "html", "http", "javascript", "json", "markdown", "ruby", "rust", "scss", "sql", "tmux", "toml", "typescript", "yaml" },
  auto_install = true, -- if enabled, install missing parsers when editing a new file
  highlight = true, -- treesitter highlighting is enabled by default
  -- languages = {}, -- override or add new parser sources
  -- parser_dir = vim.fn.stdpath("data") .. "/site/parser",
  -- query_dir = vim.fn.stdpath("data") .. "/site/queries",
})
