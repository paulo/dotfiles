-- Lightline configuration (status bar)
local LightlineFugitive = function()
  local fname = vim.fn.expand('%:t')
  if fname:match('NvimTree') then
    return ''
  elseif vim.fn.exists('*fugitive#head') ~= 0 then
    local branch = vim.fn['fugitive#head']()
    return branch ~= '' and ' ' .. branch or ''
  end
  return ''
end

local NerdPercent = function()
  local fname = vim.fn.expand('%:t')
  if fname:match('NvimTree') then
    return ''
  end
  return tostring(vim.fn.line('.') * 100 / vim.fn.line('$')) .. '%'
end

-- based of itchyny/lightline-powerful
vim.g.lightline = {
  colorscheme = 'tender',
  active = {
    left = {
      { 'mode', 'paste' },
      { 'gitbranch', 'filename' },
    },
    right = {
      { 'lineinfo' },
      { 'percent' },
      { 'filetype' },
    },
  },
  inactive = {
    left = {
      { 'filename' },
    },
    right = {
      { 'lineinfo' },
      { 'percent' },
    },
  },
  tabline = {
    left = {
      { 'buffers' },
    },
    right = {},
  },
  tab = {
    active = { 'tabnum', 'readonly', 'filename', 'modified' },
    inactive = { 'tabnum', 'readonly', 'filename', 'modified' },
  },
  component = {
    lineinfo = ' %3l:%-2v',
  },
  component_function = {
    gitbranch = 'LightlineFugitive',
    percent = 'NerdPercent',
  },
}

-- Powerline-like separators
vim.g.lightline.separator = {
  left = '',
  right = '',
}
vim.g.lightline.subseparator = {
  left = '',
  right = '',
}

-- Get rid of 'insert' mode indicator in command line
vim.o.showmode = false

-- For git gutter
vim.cmd('hi clear SignColumn')
vim.cmd('hi SignColumn ctermbg=235')

-- Lightline configuration (upper bar)
vim.o.showtabline = 1 -- Hide tabline (2 to show)

-- Bufferline functionality for the lightline vim plugin
-- vim.g.lightline.tabline = { left = { { 'buffers' } }, right = {} }
-- vim.g.lightline.component_expand = { buffers = 'lightline#bufferline#buffers' }
-- vim.g.lightline.component_type = { buffers = 'tabsel' }

-- if vim.fn.has('gui_running') == 1 then
--   vim.o.guioptions = vim.o.guioptions:gsub('e', '') -- Don't use GUI tabline
-- end

-- From 'mengelbrecht/lightline-bufferline'
-- vim.g.lightline_filename_modifier = ':t'

