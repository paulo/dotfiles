-- Configure autocompletion menu highlight
vim.opt.pumblend = 10 -- Semi-transparent pop-up menu
vim.cmd("hi Pmenu ctermbg=247 guibg=#424242")
vim.cmd("hi PmenuSel cterm=bold ctermbg=yellow guifg=#0EB1D2 guibg=#686963 gui=bold")
vim.cmd("hi PmenuSbar ctermbg=0 guibg=#424242 guifg=#424242")
vim.cmd("hi PmenuThumb ctermbg=0 guibg=#F7EF99 guifg=#F7EF99")

-- Number display
vim.cmd("hi LineNr ctermfg=lightyellow cterm=bold guifg=#F7EF99 gui=bold")
vim.cmd("hi CursorLineNr ctermfg=white cterm=bold guifg=white gui=bold")

-- Highlight color for searching and parentheses/brackets
vim.cmd("hi Search term=reverse cterm=NONE ctermfg=221 ctermbg=125 guifg=#81F499 guibg=NONE")
vim.cmd("hi MatchParen cterm=bold ctermfg=221 ctermbg=125 guifg=#0EB1D2 guibg=NONE")
vim.cmd("hi Visual cterm=bold ctermfg=221 ctermbg=125 guibg=Grey30")

-- Configure vertical splits design
vim.cmd("hi VertSplit cterm=bold ctermfg=7 ctermbg=NONE guibg=NONE guifg=Grey40")

-- Configure error coloring
vim.cmd("hi LspDiagnosticsVirtualTextError guifg=#D56062 gui=bold ctermfg=Red")

-- Configure file explorer tree
vim.cmd("hi NvimTreeFolderName guifg=#A3CEF1 gui=bold ctermfg=Blue")
vim.cmd("hi NvimTreeOpenedFolderName guifg=#CAE3F7 gui=bold ctermfg=Blue")
vim.cmd("hi NvimTreeRootFolder guifg=#ECBEB4 gui=bold ctermfg=Blue")
vim.cmd("hi NvimTreeFolderIcon guifg=#A3CEF1 ctermfg=Blue")
vim.cmd("hi NvimTreeGitDirty guifg=#F97068 gui=bold ctermfg=Blue")
vim.cmd("hi NvimTreeGitDirty guifg=#F97068 gui=bold ctermfg=Blue")
vim.cmd("hi NvimTreeNormal guifg=#73cef4 gui=bold ctermfg=Red")
vim.cmd("hi NvimTreeNormalNC guifg=#73cef4 gui=bold ctermfg=Red")

-- Configure vim-go highlighting
vim.g.go_highlight_structs = 1
vim.g.go_highlight_methods = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_build_constraints = 1
vim.g.go_highlight_extra_types = 1
vim.g.go_highlight_function_parameters = 1
vim.g.go_highlight_function_calls = 1
vim.g.go_highlight_types = 0
vim.g.go_highlight_fields = 1
vim.g.go_highlight_generate_tags = 1
vim.g.go_highlight_variable_declarations = 1
vim.g.go_highlight_variable_assignments = 0

-- colors for sneak matching
vim.cmd('highlight Sneak cterm=bold ctermfg=15 ctermbg=8 guibg=none')
