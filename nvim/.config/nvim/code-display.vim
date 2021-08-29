" Number display
set relativenumber
set nu

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

" Open new split panes to right and bottom, which feels more natural than Vim’s default
set splitbelow
set splitright

" Disable auto indent due to issue related to big files
" au FileType ruby, vim filetype indent off

" Tag management (displays all file tags)
nmap <F8> :TagbarToggle<CR>
