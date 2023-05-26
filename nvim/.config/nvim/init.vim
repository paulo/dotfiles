if empty(glob('~/.config/nvim/autoload/plug.vim'))
  " Autoinstall vim-plug
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

" Themes and powerline
Plug 'itchyny/lightline.vim'
Plug 'jacoborus/tender.vim'

" Directory, file and buffer navigation
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" Navigation and searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator' " Seamlessly navigate between vim splits and tmux panes
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Auto-complete engine
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}

" Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

" Ctags
Plug 'majutsushi/tagbar' " Nerd-tree like menu for tags

" LanguageServer client for NeoVim.
Plug 'neovim/nvim-lspconfig'

" Code display
" Plug 'luochen1990/rainbow' " Various colors for brackets and parentises.
Plug 'Yggdroot/indentLine' " Indentation lines.
Plug 'Chiel92/vim-autoformat'
Plug 'ConradIrwin/vim-bracketed-paste' " Avoid indenting when pasting
Plug 'tpope/vim-sleuth' " Automatically set idententation and tabs on buffers
Plug 'pboettch/vim-cmake-syntax' " Cmake syntax highlighting

" Code edition
Plug 'scrooloose/nerdcommenter' " Comment code.
Plug 'tpope/vim-surround' " Support for surrounding text.
Plug 'michaeljsmith/vim-indent-object' " Indentation as text objects
Plug 'kana/vim-textobj-user' " Allows the definition of new text objects
Plug 'wellle/targets.vim' " More text objects
Plug 'Raimondi/delimitMate' " Insert mode auto-completion for quotes, parens, brackets
Plug 'justinmk/vim-sneak' " Jump to any location specified by two characters
Plug 'godlygeek/tabular' " Align equals
Plug 'dyng/ctrlsf.vim' " Simulates sublime's Ctrl+Shift+F

" Accessibility
Plug 'christoomey/vim-system-copy' " Copy to clipboard
Plug 'tpope/vim-fugitive' " Git integration
Plug 'shumphrey/fugitive-gitlab.vim' " Gitlab support
Plug 'haya14busa/is.vim' " Incremental search and clear highlighting
Plug 'tpope/vim-repeat' " Enhances . command
Plug 'tpope/vim-unimpaired' " Complementary pairs of mappings
Plug 'kshenoy/vim-signature' " Support for marks

" Language support
"" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"" Rust
Plug 'rust-lang/rust.vim'
"" Ruby
Plug 'vim-ruby/vim-ruby'
"" C++
Plug 'rhysd/vim-clang-format', {'for' : ['c', 'cpp']}

" Lint
Plug 'mfussenegger/nvim-lint'

call plug#end()

" Set colorscheme
" Override: https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
syntax enable
colorscheme tender

" Leader key
let mapleader = ","
" Local leader key (for local buffers and less common mappings)
let maplocalleader = " "

set nocompatible
filetype plugin on
" filetype plugin indent on " Avoid auto identation due to lag in big files
set visualbell " No sounds

set ignorecase " Case insensitive searching
set smarttab " Smart tab handling for indenting

" Fix slow scrolling in vim due to syntax highlighting
" From https://eduncan911.com/software/fix-slow-scrolling-in-vim-and-neovim.html
set lazyredraw

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" Detect the current OS for host specific configs
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

" Python host configuration by OS
if g:os == "Darwin"
  let g:python_host_prog = '/Users/paulo/.pyenv/versions/neovim2/bin/python'
  let g:python3_host_prog = '/Users/paulo/.pyenv/versions/neovim3/bin/python3'
elseif g:os == "Linux"
  " let g:python_host_prog = '/home/paulo/.pyenv/versions/2.7.18/envs/neovim2/bin/python'
  let g:python3_host_prog = '/home/paulo/.pyenv/versions/3.8.5/envs/neovim3/bin/python3'
elseif g:os == "Windows"
  " not supported
endif

source ~/.config/nvim/powerline.vim
lua require('tree')
source ~/.config/nvim/navigation.vim
source ~/.config/nvim/code-display.vim
source ~/.config/nvim/code-edition.vim
source ~/.config/nvim/auto-completion.vim

" Code format
noremap <F2> :Autoformat<CR>

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4

" Go files have an indentation of 4 spaces
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" rusty-tags configuration (https://github.com/dan-t/rusty-tags)
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

" Write remaining tabs as 4 spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Clear highlighting by redrawing screen
" noremap <silent> <C-l> :nohl<CR><C-l> " <Ctrl-l> redraws the screen and removes any search highlighting.

" Autosave and autoread
" Will automatically save to disk the currently edited buffer upon leaving insert mode as well as after a text edit has occurred.
" Will automatically update an open buffer if it has been changed outside the current edit session, usually by an external program.
set autoread

augroup autoSaveAndRead
  autocmd!
  autocmd TextChanged,InsertLeave,FocusLost * silent! wall
  autocmd CursorHold * silent! checktime
augroup END

" Automatically equalize splits when Vim is resized
autocmd VimResized * wincmd =

" Enable wildmenu and wildmode.
" Makes setting an option, or opening new files via :e, a breeze with TAB expansion.
set wildmenu
set wildmode=full

" Convert the j and k movement commands from strict linewise movements to onscreen display line movements.
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" set guicursor= " Disable cursor change
set mouse=a " Enable scroll in normal mode

" Persistent undo. https://bluz71.github.io/2018/02/26/more-vim-tips.html
let s:undoDir = "/tmp/.undodir_" . $USER
if !isdirectory(s:undoDir)
  call mkdir(s:undoDir, "", 0700)
endif
let &undodir=s:undoDir
set undofile

" Terminal configuration
if has("nvim")
  " Make escape work in the Neovim terminal.
  " tnoremap <Esc> <C-\><C-n>

  " Make escape work in the neovim terminal as well as on the fzf splits
  au TermOpen * tnoremap <Esc> <c-\><c-n>
  au FileType fzf tunmap <Esc>

  " I like relative numbering when in normal mode.
  autocmd TermOpen * setlocal conceallevel=0 colorcolumn=0 relativenumber

  " Prefer Neovim terminal insert mode to normal mode.
  autocmd BufEnter term://* startinsert
endif

" Remove showing cursor position in the file
set noshowcmd noruler

" https://unix.stackexchange.com/questions/404414/print-true-color-24-bit-test-pattern
" https://gist.github.com/wmeng223/60b51b30eb758bd7a2a648436da1e562
set termguicolors " this variable must be enabled for colors to be applied properly

" Configure autocompletion menu highlight
set pumblend=10 " Semi-transparent pop-up menu
hi Pmenu ctermbg=247 guibg=#424242
hi PmenuSel cterm=bold ctermbg=yellow guifg=#0EB1D2 guibg=#686963 gui=bold
hi PmenuSbar ctermbg=0 guibg=#424242 guifg=#424242
hi PmenuThumb ctermbg=0 guibg=#F7EF99 guifg=#F7EF99

" Number display
hi LineNr ctermfg=lightyellow cterm=bold guifg=#F7EF99 gui=bold
hi CursorLineNr ctermfg=white cterm=bold guifg=white gui=bold

" Highlight color for searching and parentheses/brackets
hi Search term=reverse cterm=NONE ctermfg=221 ctermbg=125 guifg=#81F499 guibg=NONE
hi MatchParen cterm=bold ctermfg=221 ctermbg=125 guifg=#0EB1D2 guibg=NONE
hi Visual cterm=bold ctermfg=221 ctermbg=125 guibg=Grey30

" Configure vertical splits design
hi VertSplit cterm=bold ctermfg=7 ctermbg=NONE guibg=NONE guifg=Grey40

" Configure error coloring
hi LspDiagnosticsVirtualTextError guifg=#D56062 gui=bold ctermfg=Red

" Configure file explorer tree
hi NvimTreeFolderName guifg=#A3CEF1 gui=bold ctermfg=Blue
hi NvimTreeOpenedFolderName guifg=#CAE3F7 gui=bold ctermfg=Blue
hi NvimTreeRootFolder guifg=#ECBEB4 gui=bold ctermfg=Blue
hi NvimTreeFolderIcon guifg=#A3CEF1 ctermfg=Blue
hi NvimTreeGitDirty guifg=#F97068 gui=bold ctermfg=Blue

" Configure vim-go highlighting
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 0
let g:go_highlight_fields = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 0

" Wrap text
set textwidth=80
set wrap
set cpo=n

" Hide tildes that appear at the end of the buffer (replace by whitespace)
" Careful on editors that remove trailing whitespace, this file needs to be
" saved with one
set fcs=eob:\
