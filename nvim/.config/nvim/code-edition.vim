" Show type of variable on powerline (Go)
let g:go_auto_type_info = 1

" Go to definition. To get back, press C-t. To show the documentation, press K (Go)
au FileType go nmap <F12> <Plug>(go-def)

" Code commenting
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default.
let g:NERDCompactSexyComs = 1 " Use compact syntax for pretified multi-line comments.

" Vertical cursor column
" set cursorcolumn

" Horizontal cursor column
set cursorline

" Insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

" Enable yanking till the end of the line
noremap Y y$

" Execute a macro on an the lines of a visual block
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Avoid trailing spaces and remove them on buffer write
autocmd BufWritePre * %s/\s\+$//e

" Language server config
" Required for operations modifying multiple buffers like rename.
set hidden
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ 'go': ['go-langserver'],
    \ }

" Tabular plugin mappings
nmap <leader>a= :Tab /=<CR>
vmap <leader>a= :Tab /=<CR>
nmap <leader>a: :Tab /:\zs<CR>
vmap <leader>a: :Tab /:\zs<CR>
nmap <leader>a\| :Tab /\|<CR>
vmap <leader>a\| :Tab /\|<CR>

" Ctrl+Shift+F mappings
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
