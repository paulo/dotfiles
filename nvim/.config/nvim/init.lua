-- Autoinstall vim-plug if not already installed
if vim.fn.empty(vim.fn.glob('~/.config/nvim/autoload/plug.vim')) > 0 then
    vim.fn.system({'curl', '-fLo', '~/.config/nvim/autoload/plug.vim', '--create-dirs', 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'})
    vim.cmd('autocmd VimEnter * PlugInstall')
end

-- Vim-plug config
-- from: https://dev.to/vonheikemen/neovim-using-vim-plug-in-lua-3oom
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

-- Themes and powerline
Plug 'itchyny/lightline.vim'
Plug 'jacoborus/tender.vim'
Plug('AlexvZyl/nordic.nvim', { branch = 'main' })

-- Directory, file and buffer navigation
Plug 'nvim-tree/nvim-web-devicons' -- for file icons
Plug 'nvim-tree/nvim-tree.lua'

-- Navigation and searching
Plug('junegunn/fzf', {dir = '~/.fzf', ['do'] = vim.fn['fzf#install --all']})
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator' -- Seamlessly navigate between vim splits and tmux panes
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

-- Snippets
Plug('ms-jpq/coq.artifacts', {branch = 'artifacts'})

-- LanguageServer client for NeoVim.
Plug 'neovim/nvim-lspconfig'
Plug 'onsails/diaglist.nvim' -- see diagnostics on quickfix list

-- Code display
-- Plug 'luochen1990/rainbow' -- Various colors for brackets and parentises.
Plug 'Yggdroot/indentLine' -- Indentation lines.
Plug 'Chiel92/vim-autoformat'
Plug 'ConradIrwin/vim-bracketed-paste' -- Avoid indenting when pasting
Plug 'tpope/vim-sleuth' -- Automatically set idententation and tabs on buffers
Plug 'pboettch/vim-cmake-syntax' -- Cmake syntax highlighting
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

-- Code edition
Plug 'scrooloose/nerdcommenter' -- Comment code.
Plug 'tpope/vim-surround' -- Support for surrounding text.
Plug 'michaeljsmith/vim-indent-object' -- Indentation as text objects
Plug 'kana/vim-textobj-user' -- Allows the definition of new text objects
Plug 'wellle/targets.vim' -- More text objects
Plug 'Raimondi/delimitMate' -- Insert mode auto-completion for quotes, parens, brackets
Plug 'justinmk/vim-sneak' -- Jump to any location specified by two characters
Plug 'godlygeek/tabular' -- Align equals
Plug 'dyng/ctrlsf.vim' -- Simulates sublime's Ctrl+Shift+F
Plug 'sbdchd/neoformat' -- Format code automatically

-- Accessibility
Plug 'christoomey/vim-system-copy' -- Copy to clipboard
Plug 'tpope/vim-fugitive' -- Git integration
Plug 'haya14busa/is.vim' -- Incremental search and clear highlighting
Plug 'tpope/vim-repeat' -- Enhances . command
Plug 'tpope/vim-unimpaired' -- Complementary pairs of mappings
Plug 'kshenoy/vim-signature' -- Support for marks

-- Language support
-- Go
Plug('fatih/vim-go', {['do'] = ':GoUpdateBinaries'})
-- Ruby
Plug 'vim-ruby/vim-ruby'
-- C++
Plug('rhysd/vim-clang-format', {['for'] = {'c', 'cpp', 'cc', 'h'}})

-- AI assistance
Plug 'stevearc/dressing.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'MeanderingProgrammer/render-markdown.nvim'
Plug 'HakonHarnes/img-clip.nvim'
Plug('github/copilot.vim') -- I tried try 'zbirenbaum/copilot.lua', and
-- although it's pure Lua, the config is hard to get right. I'll try again in
-- the future.

-- Pass source=true if you want to build from source
Plug('yetone/avante.nvim', { branch = 'main', ['do'] = 'make' })

-- Auto-complete engine
Plug('ms-jpq/coq_nvim', {branch = 'coq'})
Plug('ms-jpq/coq.thirdparty')

vim.call('plug#end')

-- Set colorscheme
vim.cmd('syntax enable')
-- vim.cmd('colorscheme tender') -- transitioning to nordic

require 'nordic' .setup {
    -- This callback can be used to override the colors used in the palette.
    -- Default: https://github.com/AlexvZyl/nordic.nvim/blob/main/lua/nordic/colors/nordic.lua
    on_palette = function(palette)
        palette.gray0 = '#262626'
        palette.blue1 = '#73cef4'
    end,
    -- Enable bold keywords.
    bold_keywords = true,
    -- Enable italic comments.
    italic_comments = true,
    transparent = {
        -- Enable transparent background.
        bg = false,
    },
    -- Enable brighter float border.
    bright_border = true,
    -- Reduce the overall amount of blue in the theme (diverges from base Nord).
    reduced_blue = true,
    -- Swap the dark background with the normal one.
    swap_backgrounds = false,
    -- Cursorline options.  Also includes visual/selection.
    cursorline = {
        -- Bold font in cursorline.
        bold = false,
        -- Bold cursorline number.
        bold_number = true,
        -- Available styles: 'dark', 'light'.
        theme = 'dark',
        -- Blending the cursorline bg with the buffer bg.
        blend = 0.75,
    }
}

vim.cmd.colorscheme 'nordic'

-- Detect the current OS for host specific configs
if not vim.g.os then
    if vim.fn.has('win64') or vim.fn.has('win32') or vim.fn.has('win16') then
        vim.g.os = "Windows"
    else
        vim.g.os = vim.fn.substitute(vim.fn.system('uname'), '\n', '', '')
    end
end

-- Python host configuration by OS
if vim.g.os == "Darwin" then
    vim.g.python_host_prog = '/Users/paulo/.pyenv/versions/neovim2/bin/python'
    vim.g.python3_host_prog = '/Users/paulo/.pyenv/versions/neovim3/bin/python3'
elseif vim.g.os == "Linux" then
    -- vim.g.python_host_prog = '/home/paulo/.pyenv/versions/2.7.18/envs/neovim2/bin/python'
    vim.g.python3_host_prog = '/home/paulo/.pyenv/versions/3.8.5/envs/neovim3/bin/python3'
elseif vim.g.os == "Windows" then
    -- not supported
end

require('base')
require('theme')
require('powerline')
require('tree')
require('navigation')
require('search')
require('display')
require('edit')
require('ai')
require('autocomplete')

-- rusty-tags configuration
vim.cmd("autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi")
vim.cmd("autocmd BufWritePost *.rs :silent! exec '!rusty-tags vi --quiet --start-dir=' . expand('%:p:h') . '&' | redraw!")

if vim.env.term == 'screen-256color' then
    vim.g.tmux_navigator_no_mappings = 1
    vim.api.nvim_set_keymap('n', '<C-h>', ':TmuxNavigateLeft<CR>', { silent = true })
    vim.api.nvim_set_keymap('n', '<C-j>', ':TmuxNavigateDown<CR>', { silent = true })
    vim.api.nvim_set_keymap('n', '<C-k>', ':TmuxNavigateUp<CR>', { silent = true })
    vim.api.nvim_set_keymap('n', '<C-l>', ':TmuxNavigateRight<CR>', { silent = true })
end
