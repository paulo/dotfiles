-- Number display
vim.opt.relativenumber = true
vim.opt.number = true

-- Customize how diagnostics are displayed
-- From https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#customizing-how-diagnostics-are-displayed
-- These are currently the default values
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

-- Change diagnostic symbols in the sign column
-- From https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#change-diagnostic-symbols-in-the-sign-column-gutter
vim.diagnostic.config({
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
  buffer = bufnr,
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end
})

-- Rainbow parenthesis configuration
vim.g.rainbow_active = 1
vim.g.rainbow_conf = {
  guifgs = {'royalblue3', 'darkorange3', 'seagreen3', 'firebrick'},
  ctermfgs = {'lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'},
  operators = '_,_',
  parentheses = {'start=/(/ end=/)/ fold', 'start=/\\[/ end=/\\]/ fold', 'start=/{/ end=/}/ fold'},
  separately = {
    ['*'] = {},
    tex = {
      parentheses = {'start=/(/ end=/)/', 'start=/\\[/ end=/\\]/'},
    },
    vim = {
      parentheses = {
        'start=/(/ end=/)/',
        'start=/\\[/ end=/\\]/',
        'start=/{/ end=/}/ fold',
        'start=/(/ end=/)/ containedin=vimFuncBody',
        'start=/\\[/ end=/\\]/ containedin=vimFuncBody',
        'start=/{/ end=/}/ fold containedin=vimFuncBody',
      },
    },
    css = 0,
  },
}

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
