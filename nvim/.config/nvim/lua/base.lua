-- Base editor config

-- Leader key
vim.g.mapleader = ','
-- Local leader key (for local buffers and less common mappings)
vim.g.maplocalleader = ' '

-- vim.opt.nocompatible = true (enabled by default)
vim.cmd('filetype plugin on')
-- vim.cmd('filetype plugin indent on') -- Avoid auto indentation due to lag in big files
vim.opt.visualbell = true -- No sounds

vim.opt.ignorecase = true -- Case insensitive searching
vim.opt.smarttab = true -- Smart tab handling for indenting

-- Fix slow scrolling in Vim due to syntax highlighting
-- From https://eduncan911.com/software/fix-slow-scrolling-in-vim-and-neovim.html
vim.opt.lazyredraw = true

-- Clear highlighting on escape in normal mode
vim.api.nvim_set_keymap('n', '<esc>', ':noh<CR><esc>', { silent = true })
vim.api.nvim_set_keymap('n', '<esc>^[', '<esc>^[', { silent = true })

-- Code format
vim.api.nvim_set_keymap('n', '<F2>', ':Autoformat<CR>', { silent = true })

-- Set options for specific filetypes
vim.cmd('autocmd Filetype html setlocal ts=2 sts=2 sw=2')
vim.cmd('autocmd Filetype ruby setlocal ts=2 sts=2 sw=2')
vim.cmd('autocmd Filetype javascript setlocal ts=4 sts=4 sw=4')

-- Go files have an indentation of 4 spaces
vim.cmd('autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4')

-- Write remaining tabs as 4 spaces
vim.o.tabstop = 8
vim.o.softtabstop = 0
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.smarttab = true

-- Clear highlighting by redrawing screen
-- vim.api.nvim_set_keymap('n', '<C-l>', ':nohl<CR><C-l>', { silent = true })

-- Autosave and autoread
-- Will automatically save to disk the currently edited buffer upon leaving insert mode as well as after a text edit has occurred.
-- Will automatically update an open buffer if it has been changed outside the current edit session, usually by an external program.
vim.cmd([[
augroup autoSaveAndRead
  autocmd!
  autocmd TextChanged,InsertLeave,FocusLost * silent! wall
  autocmd CursorHold * silent! checktime
augroup END
]])

-- Automatically equalize splits when Vim is resized
vim.cmd('autocmd VimResized * wincmd =')

-- Enable wildmenu and wildmode
vim.o.wildmenu = true
vim.o.wildmode = 'full'

-- Convert the j and k movement commands from strict linewise movements to onscreen display line movements.
vim.api.nvim_set_keymap('n', 'j', 'v:count ? (v:count > 5 ? "m\'" . v:count : "") . "j" : "gj"', { expr = true })
vim.api.nvim_set_keymap('n', 'k', 'v:count ? (v:count > 5 ? "m\'" . v:count : "") . "k" : "gk"', { expr = true })

-- Disable cursor change
-- vim.o.guicursor = ''

-- Enable mouse scroll in normal mode
vim.o.mouse = 'a'

-- Persistent undo. https://bluz71.github.io/2018/02/26/more-vim-tips.html
local undoDir = '/tmp/.undodir_' .. vim.fn.expand('$USER')
if not vim.fn.isdirectory(undoDir) then
    vim.fn.mkdir(undoDir, '', 0700)
end
vim.o.undodir = undoDir
vim.o.undofile = true

-- Terminal configuration
if vim.fn.has("nvim") == 1 then
  -- Make escape work in the Neovim terminal.
  -- vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { silent = true })

  -- Make escape work in the neovim terminal as well as on the fzf splits
  vim.cmd([[
    augroup TerminalMappings
      autocmd!
      autocmd TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>
    augroup END
  ]])

  -- Remove mapping of escape key in fzf buffers
  vim.cmd("autocmd FileType fzf tunmap <buffer> <Esc>")

  -- I like relative numbering when in normal mode.
  vim.cmd([[
    augroup TerminalOptions
      autocmd!
      autocmd TermOpen * setlocal conceallevel=0 colorcolumn=0 relativenumber
    augroup END
  ]])

  -- Prefer Neovim terminal insert mode to normal mode.
  vim.cmd("autocmd BufEnter term://* startinsert")
end

-- Remove showing cursor position in the file
vim.opt.showcmd = false
vim.opt.ruler = false

-- Enable true color support
-- https://unix.stackexchange.com/questions/404414/print-true-color-24-bit-test-pattern
-- https://gist.github.com/wmeng223/60b51b30eb758bd7a2a648436da1e562
if vim.fn.has('termguicolors') == 1 then
    vim.o.termguicolors = true
    vim.opt.termguicolors = true
end

-- Wrap text
vim.opt.textwidth = 80
vim.opt.wrap = true
vim.opt.cpo:remove("n")

-- Hide tildes that appear at the end of the buffer (replace by whitespace)
-- This is configured using a diagraph (check the whitespace after eob:)
-- so the linter doesn't remove the trailing whitespace
vim.opt.fillchars = { eob = ' ' }

-- Window splitting and quitting
vim.api.nvim_set_keymap('n', '<leader>s', ':split<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>v', ':vsplit<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':close<CR>', { silent = true })

-- Buffer navigation helpers
vim.api.nvim_set_keymap('n', '<leader>h', ':bp<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>l', ':bn<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>t', ':enew<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':bp <BAR> bd #<CR>', { silent = true })


-- There are multiple choices available when choosing a fold method. <leader><Space> toggles a fold based on the indent level of the current cursor line
vim.api.nvim_set_keymap('n', '<leader><Space>', 'za', { silent = true })

-- Quickfix list settings
vim.api.nvim_set_keymap('n', '<leader><leader>o', ':copen<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader><leader>q', ':cclose<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader><leader>t', ':cwindow<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>j', ':cnext<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>k', ':cprevious<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader><leader>k', ':cnfile<CR>', { silent = true })

-- Navigate between vim splits and tmux panes with C-h/j/k/l
-- (https://bluz71.github.io/2017/06/14/a-few-vim-tmux-mappings.html)
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { silent = true })

