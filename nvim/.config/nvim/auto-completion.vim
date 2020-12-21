" Enable deoplete at start up
let g:deoplete#enable_at_startup = 1

" Configure deoplete menu highlight
highlight Pmenu ctermbg=247 guibg=#dddbdb
highlight PmenuSel cterm=bold ctermbg=yellow guifg=#dddd00 guibg=#1f82cd
highlight PmenuSbar ctermbg=0 guibg=#dddbdb

" This will show the popup menu even if there's only one match (menuone),
" prevent automatic selection (noselect) and prevent automatic text injection
" into the current line (noinsert).
set completeopt=noinsert,menuone,noselect

" Suppress the annoying 'match x of y', 'The only match' and 'Pattern not found' messages
set shortmess+=c

" Use <TAB> to select the popup menu:
inoremap <expr><TAB>  pumvisible() ? '<C-n>' : '<TAB>'
inoremap <expr><S-Tab> pumvisible() ? '<c-P>' : '<S-Tab>'

" Language server config
" Required for operations modifying multiple buffers like rename.
set hidden
" How to: https://github.com/autozimu/LanguageClient-neovim/issues/35
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ 'go': ['go-langserver'],
    \ 'cpp': ['clangd'],
    \ 'sh': ['bash-language-server', 'start'],
    \ 'Dockerfile': ['docker-langserver --stdio']
    \ }

" Snippets engine setup
let g:UltiSnipsExpandTrigger = "<leader>e"
let g:UltiSnipsJumpForwardTrigger = "<leader>e"
let g:UltiSnipsJumpBackwardTrigger = "<leader>E"
let g:UltiSnipsEditSplit="vertical" " :UltiSnipsEdit to split your window.
let g:UltiSnipsRemoveSelectModeMappings = 0

call deoplete#custom#var('tabnine', {
\ 'line_limit': 100,
\ 'max_num_results': 5,
\ })

" C++ deoplete config
let g:deoplete#sources#clang#libclang_path='/usr/local/Cellar/llvm/10.0.1_1/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header='/usr/local/opt/llvm/include/clang'
