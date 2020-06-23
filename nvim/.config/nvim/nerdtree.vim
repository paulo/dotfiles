" Open NerdTree
noremap <Leader>d :NERDTreeToggle<CR>
" Open Nerdtree at the current file
nnoremap <silent> <Leader><Leader>d :NERDTreeFind<CR>

" Nerdtree symbols and visuals
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinPos = "left"

" Open Nerdtree if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Automatically close a tab if the only remaining window is NerdTree
autocmd Bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Automatically delete the buffer of the file you just deleted with NerdTree
let NERDTreeAutoDeleteBuffer = 1

" Show hidden files by default (toogle with I)
let NERDTreeShowHidden = 1

" Hide powerline from nerdtred with the relative path of the directory the file is in use
let g:NERDTreeStatusline=expand("%:h")

" Hide tildes that appear at the end of the buffer
set fcs=eob:\
