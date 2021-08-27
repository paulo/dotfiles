" https://github.com/kyazdani42/nvim-tree.lua
" Open Tree
nnoremap <leader>d :NvimTreeToggle<CR>
" Open Tree at the current file
nnoremap <silent> <leader><leader>d :NvimTreeFindFile<CR>

" Hide tildes that appear at the end of the buffer
set fcs=eob:\

let g:nvim_tree_ignore = [ '.git', 'node_modules', 'tags', '.DS_Store', 'dist' ] "empty by default
let g:nvim_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_auto_resize = 0 "1 by default, will resize the tree to its saved width when opening a file
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_lsp_diagnostics = 1 "0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics

set termguicolors " this variable must be enabled for colors to be applied properly

lua <<EOF
    local tree_cb = require'nvim-tree.config'.nvim_tree_callback
    vim.g.nvim_tree_bindings = {
      { key = "s",                        cb = tree_cb("vsplit") },
      { key = "v",                        cb = tree_cb("split") },
      { key = "R",                            cb = tree_cb("refresh") },
      { key = "i",                            cb = tree_cb("system_open") },
    }
EOF

" a list of groups can be found at `:help nvim_tree_highlight`
" highlight NvimTreeFolderIcon guibg=blue
