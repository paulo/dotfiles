" https://github.com/kyazdani42/nvim-tree.lua
" Open Tree
nnoremap <leader>d :NvimTreeToggle<CR>
" Open Tree at the current file
nnoremap <silent> <leader><leader>d :NvimTreeFindFile<CR>

" Hide tildes that appear at the end of the buffer (replace by whitespace)
" Careful on editors that remove trailing whitespace, this file needs to be
" saved with one
set fcs=eob:\ 

let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_group_empty = 0 " 0 by default, compact folders that only contain a single folder into one node in the file tree

lua <<EOF
    local tree_cb = require'nvim-tree.config'.nvim_tree_callback

    require'nvim-tree'.setup {
      disable_netrw       = true,
      hijack_netrw        = true,
      open_on_setup       = false,
      ignore_ft_on_setup  = {},
      auto_close          = true, -- false by default, closes the tree when it's the last window
      open_on_tab         = false,
      hijack_cursor       = false,
      update_cwd          = false,
      update_to_buf_dir   = {
        enable = true,
        auto_open = true,
      },
      diagnostics = { -- false by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
        enable = false,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        }
      },
      update_focused_file = {
        enable      = false,
        update_cwd  = false,
        ignore_list = {}
      },
      system_open = {
        cmd  = nil,
        args = {}
      },
      filters = {
        dotfiles = false,
        custom = {'.git', 'node_modules', 'tags', '.DS_Store', 'dist'}
      },
      git = {
        enable = true,
        ignore = true,
        timeout = 500,
      },
      view = {
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = 'left',
        auto_resize = true, -- false by default, will resize the tree to its saved width when opening a file
        mappings = {
          custom_only = false,
          list = {
              { key = "v", cb = tree_cb("vsplit") },
              { key = "s", cb = tree_cb("split") },
              { key = "R", cb = tree_cb("refresh") },
              { key = "i", cb = tree_cb("system_open") },
          }
        },
        number = false,
        relativenumber = false,
        signcolumn = "yes"
      },
      trash = {
        cmd = "trash",
        require_confirm = true
      }
    }
EOF
