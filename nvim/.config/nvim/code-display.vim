" Highlight color for searching and parentheses/brackets
hi Search term=reverse cterm=NONE ctermfg=221 ctermbg=125
hi MatchParen cterm=bold ctermfg=221 ctermbg=125
hi Visual cterm=bold ctermfg=221 ctermbg=125 guibg=Grey40
" Configure vertical splits design
" set fillchars+=vert:\|
" hi VertSplit cterm=bold ctermfg=221 ctermbg=125 guibg=Grey40
hi VertSplit cterm=bold ctermfg=8 ctermbg=NONE guibg=NONE

" Number display
set relativenumber
set nu
hi LineNr ctermfg=yellow cterm=bold
hi CursorLineNr ctermfg=white cterm=bold

" Rainbow parenthesis configuration
let g:rainbow_active = 1
let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'css': 0,
    \   }
    \}

" Performance improvement for indenting lines
" let g:indentLine_faster = 1
let g:indentLine_setConceal = 0

" Show text wrap on the line number
let &showbreak = ' ↳ '
set wrap
set cpo=n

" Go files have an indentation of 4 spaces
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" Open new split panes to right and bottom, which feels more natural than Vim’s default
set splitbelow
set splitright

" Disable auto indent due to issue related to big files
" au FileType ruby, vim filetype indent off

" Tag management (displays all file tags)
nmap <F8> :TagbarToggle<CR>
