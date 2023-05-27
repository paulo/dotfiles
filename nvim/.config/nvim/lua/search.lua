-- Fzf config

-- this needs to be set to fzf's installation path
vim.o.runtimepath = vim.o.runtimepath .. ',/opt/homebrew/opt/fzf'

vim.g.fzf_colors = {
  fg = {'fg', 'Normal'},
  bg = {'bg', 'Normal'},
  hl = {'fg', 'Comment'},
  ['fg+'] = {'fg', 'CursorLine', 'CursorColumn', 'Normal'},
  ['bg+'] = {'bg', 'CursorLine', 'Normal'},
  ['hl+'] = {'fg', 'PreProc'},
  info = {'fg', 'PreProc'},
  prompt = {'fg', 'Conditional'},
  pointer = {'fg', 'Exception'},
  marker = {'fg', 'Keyword'},
  spinner = {'fg', 'Label'},
  header = {'fg', 'Comment'}
}

-- function has to be defined globally so the autocmd! works
_G.fzf_statusline = function()
  -- Override statusline as you like
  vim.cmd('highlight fzf1 ctermfg=161 ctermbg=153')
  vim.cmd('highlight fzf2 ctermfg=23 ctermbg=153')
  vim.cmd('highlight fzf3 ctermfg=237 ctermbg=153')
  vim.opt_local.statusline = "%#fzf1# > %#fzf2#fz%#fzf3#f"
end

vim.cmd("autocmd! User FzfStatusLine lua fzf_statusline()")

-- All fzf commands are preceded by fzf
vim.g.fzf_command_prefix = 'Fzf'

-- Jump to the existing window if possible
vim.g.fzf_buffers_jump = 1

-- Default extra key bindings
vim.g.fzf_action = {
  ['ctrl-t'] = 'tab split',
  ['ctrl-s'] = 'split',
  ['ctrl-v'] = 'vsplit'
}

-- Default fzf layout
vim.g.fzf_layout = {down = '~20%'}

-- Augmenting Ag command using fzf#vim#with_preview function
--   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
--   :Ag! - Start fzf in fullscreen and display the preview window above
vim.cmd([[
  command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
      \                         : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
      \                 <bang>0)

  " Enabling Rg fuzzy finding with Ripgrep as well
  command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg -g "!.git" -g "!_build" -g "!deps" -g "!vendor" --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
      \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
      \   <bang>0)
]])

-- Key mappings
vim.api.nvim_set_keymap('n', '<leader><leader>f', ':FzfFiles<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader><leader>b', ':FzfBuffers<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader><leader>w', ':FzfWindows<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader><leader>/', ':Rg<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader><leader>?f', ':FzfHistory<CR>', {noremap = true, silent = true})

