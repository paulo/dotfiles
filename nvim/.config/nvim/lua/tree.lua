-- Config for https://github.com/nvim-tree/nvim-tree.lua

-- Open Tree
vim.api.nvim_set_keymap('n', '<leader>d', ':NvimTreeToggle<CR>', { noremap = true })

-- Open Tree at the current file
vim.api.nvim_set_keymap('n', '<leader><leader>d', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })

-- automatically close the tab/vim when nvim-tree is the last window in the tab
-- (TODO: migrate to lua)
-- autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

-- Auto-generated function from tree plugin to define mappings
-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Migrating-To-on_attach
local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', 's', api.node.open.horizontal, opts('Open: Horizontal Split'))
  vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
  vim.keymap.set('n', 'i', api.node.run.system, opts('Run System'))
end

require "nvim-tree".setup {
    on_attach = on_attach,
    disable_netrw = true,
    hijack_netrw = true,
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = false,
    diagnostics = {
        -- false by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
        enable = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = ""
        }
    },
    update_focused_file = {
        enable = false,
        update_cwd = false,
        ignore_list = {}
    },
    system_open = {
        cmd = nil,
        args = {}
    },
    filters = {
        dotfiles = false,
        custom = {".git$", "node_modules", "tags", ".DS_Store", "dist"}
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500
    },
    view = {
        width = 30,
        hide_root_folder = false,
        side = "left",
        mappings = {
            custom_only = false
        },
        number = false,
        relativenumber = false,
        signcolumn = "yes"
    },
    trash = {
        cmd = "trash",
        require_confirm = true
    },
    actions = {
        open_file = {
            window_picker = {
                enable = false
            },
            resize_window = true,  -- false by default, will resize the tree to its saved width when opening a file
        }
    },
    renderer = {
        highlight_git = true, -- false by default, will enable file highlight for git attributes (can be used without the icons).
        group_empty = false -- false by default, compact folders that only contain a single folder into one node in the file tree
    }
}

-- Will automatically open the tree when running setup if startup buffer is
-- a directory, is empty, is a file or is unnamed. nvim-tree window or file
-- will be focused.
-- From: https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup
local function open_nvim_tree(data)

  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  -- buffer is a real file on the disk
  local real_file = vim.fn.filereadable(data.file) == 1

  if not no_name and not directory and not real_file then
    return
  end

  -- change to the directory
  if directory then
    vim.cmd.cd(data.file)
  end

  if real_file then
      -- open the tree but don't focus it
      require("nvim-tree.api").tree.toggle({ focus = false })
      return
  end

  -- open the tree
  require("nvim-tree.api").tree.open()
end

-- assign function to open tree at startup
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
