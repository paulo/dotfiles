-- Telescope is the fuzzy-finding menu for file/buffer search

-- Find files using Telescope command-line sugar
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>/', '<cmd>Telescope live_grep<cr>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>Telescope buffers<cr>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>h', '<cmd>Telescope help_tags<cr>', { silent = true })

local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '-uu'
    },
    prompt_prefix = "🔍 ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "flex",
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = { 'node_modules', '.git', 'tags' },
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 10,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<esc>"] = actions.close,
        ["<C-s>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      },
      n = {
        ["<esc>"] = actions.close,
        ["<C-s>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist
      }
    }
  }
}
