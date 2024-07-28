-- Number display
vim.opt.relativenumber = true
vim.opt.number = true

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

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "css", "bash", "cpp", "dockerfile", "elixir", "git_config", "git_rebase", "gitcommit", "go", "gomod", "gosum", "html", "http", "javascript", "json", "markdown", "ruby", "rust", "scss", "sql", "tmux", "toml", "typescript", "yaml" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally (can be done with brew install tree-sitter)
  auto_install = true,

  indent = {
    enable = true
  },

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
