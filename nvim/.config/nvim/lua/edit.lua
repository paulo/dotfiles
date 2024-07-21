-- Show type of variable on powerline (Go)
vim.g.go_auto_type_info = 1

-- Go to definition. To get back, press C-t. To show the documentation, press K (Go)
vim.api.nvim_command('autocmd FileType go nmap <F12> <Plug>(go-def)')

-- Code commenting
vim.g.NERDSpaceDelims = 1 -- Add spaces after comment delimiters by default.
vim.g.NERDCompactSexyComs = 1 -- Use compact syntax for prettified multi-line comments.

-- Vertical cursor column
-- vim.wo.cursorcolumn = true

-- Horizontal cursor column
vim.wo.cursorline = true

-- Insert an empty new line without entering insert mode
vim.api.nvim_set_keymap('n', '<Leader>o', 'o<Esc>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>O', 'O<Esc>', { noremap = true })

-- Enable yanking till the end of the line
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })


-- Execute a macro on the lines of a visual block
vim.api.nvim_set_keymap('x', '@', ':<C-u>call ExecuteMacroOverVisualRange()<CR>', {})

function ExecuteMacroOverVisualRange()
  vim.api.nvim_echo({{ "@" .. vim.fn.getcmdline(), "Normal"}}, true, {})
  vim.cmd("'<,'>normal @'" .. vim.fn.nr2char(vim.fn.getchar()))
end

-- Avoid trailing spaces and remove them on buffer write
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])

-- Tabular plugin mappings
vim.api.nvim_set_keymap('n', '<leader>a=', ':Tab /=<CR>', {})
vim.api.nvim_set_keymap('v', '<leader>a=', ':Tab /=<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>a:', ':Tab /:\zs<CR>', {})
vim.api.nvim_set_keymap('v', '<leader>a:', ':Tab /:\zs<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>a\\|', ':Tab /\\|<CR>', {})
vim.api.nvim_set_keymap('v', '<leader>a\\|', ':Tab /\\|<CR>', {})

-- Ctrl+Shift+F mappings
vim.api.nvim_set_keymap('n', '<C-F>f', '<Plug>CtrlSFPrompt', {})
vim.api.nvim_set_keymap('v', '<C-F>f', '<Plug>CtrlSFVwordPath', {})
vim.api.nvim_set_keymap('n', '<C-F>n', '<Plug>CtrlSFCwordPath', {})
vim.api.nvim_set_keymap('n', '<C-F>p', '<Plug>CtrlSFPwordPath', {})
vim.api.nvim_set_keymap('n', '<C-F>o', ':CtrlSFOpen<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-F>t', ':CtrlSFToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-F>t', '<Esc>:CtrlSFToggle<CR>', { noremap = true })

-- Enable folding
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 99

-- Enable folding with the spacebar
vim.api.nvim_set_keymap('n', '<space>', 'za', {})

-- Autoformat cpp files
vim.g.clang_format_auto_format = 1

vim.g.neoformat_try_node_exe = 1
vim.g.neoformat_only_msg_on_error = 1

-- Define an autocmd that triggers before saving a buffer. Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("fmt", { clear = true }),
  pattern = "*",
  command = "undojoin | Neoformat",
})
