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

-- Directory, file and buffer navigation
Plug 'kyazdani42/nvim-web-devicons' -- for file icons
Plug 'kyazdani42/nvim-tree.lua'

-- Navigation and searching
Plug('junegunn/fzf', {dir = '~/.fzf', ['do'] = vim.fn['fzf#install --all']})
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator' -- Seamlessly navigate between vim splits and tmux panes
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

-- Auto-complete engine
Plug('ms-jpq/coq_nvim', {branch = 'coq'})

-- Snippets
Plug('ms-jpq/coq.artifacts', {branch = 'artifacts'})

-- Ctags
Plug 'majutsushi/tagbar' -- Nerd-tree like menu for tags

-- LanguageServer client for NeoVim.
Plug 'neovim/nvim-lspconfig'

-- Code display
-- Plug 'luochen1990/rainbow' -- Various colors for brackets and parentises.
Plug 'Yggdroot/indentLine' -- Indentation lines.
Plug 'Chiel92/vim-autoformat'
Plug 'ConradIrwin/vim-bracketed-paste' -- Avoid indenting when pasting
Plug 'tpope/vim-sleuth' -- Automatically set idententation and tabs on buffers
Plug 'pboettch/vim-cmake-syntax' -- Cmake syntax highlighting

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
-- Rust
Plug 'rust-lang/rust.vim'
-- Ruby
Plug 'vim-ruby/vim-ruby'
-- C++
Plug('rhysd/vim-clang-format', {['for'] = {'c', 'cpp'}})

-- Lint
Plug 'mfussenegger/nvim-lint'

vim.call('plug#end')

-- Set colorscheme
vim.cmd('syntax enable')
vim.cmd('colorscheme tender')

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

-- Go configuration for tagbar
vim.g.tagbar_type_go = {
    ctagstype = 'go',
    kinds = {
        'p:package',
        'i:imports:1',
        'c:constants',
        'v:variables',
        't:types',
        'n:interfaces',
        'w:fields',
        'e:embedded',
        'm:methods',
        'r:constructor',
        'f:functions',
    },
    sro = '.',
    kind2scope = {
        t = 'ctype',
        n = 'ntype',
    },
    scope2kind = {
        ctype = 't',
        ntype = 'n',
    },
    ctagsbin = 'gotags',
    ctagsargs = '-sort -silent',
}

