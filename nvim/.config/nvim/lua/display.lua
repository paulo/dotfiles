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
-- vim.cmd('autocmd FileType ruby, vim filetype indent off')

-- Tag management (displays all file tags)
vim.api.nvim_set_keymap('n', '<F8>', ':TagbarToggle<CR>', { noremap = true })

