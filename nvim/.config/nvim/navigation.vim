" Window spliting and quiting
nnoremap <silent> <leader>s :split<CR>
nnoremap <silent> <leader>v :vsplit<CR>
nnoremap <silent> <leader>q :close<CR>

" Buffer navigation helpers
nmap <leader>h :bp<cr> " Go to the previous buffer open
nmap <leader>l :bn<cr> " Go to the next buffer open
nmap <leader>t :enew<cr> " Open a new empty buffer. Replaces :tabnew
nmap <leader>q :bp <BAR> bd #<cr> " Close the current buffer and move to the previous one

" There are multiple choices available when choosing a fold method. <leader><Space> toggles a fold based on the indent level of the current cursor line
nnoremap <leader><Space> za

" Quickfix list settings
nnoremap <leader><leader>o :copen<cr> " Open the quickfix window
nnoremap <leader><leader>q :ccl<cr> " Close it
nnoremap <leader><leader>t :cw<cr> " Open it if there are "errors", close it otherwise (some people prefer this)
nnoremap <leader>j :cn<cr> " Go to the next error in the window
nnoremap <leader>k :cp<cr> " Go to the previous error in the window
nnoremap <leader><leader>k :cnf<cr> " Go to the first error in the next file

" Navigate between vim splits and tmux panes with C-h/j/k/l
" (https://bluz71.github.io/2017/06/14/a-few-vim-tmux-mappings.html)
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

if &term == 'screen-256color'
  let g:tmux_navigator_no_mappings = 1
  nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
  nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
  nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
  nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
endif

" Sneak
" Go to the next match using S again
" Type ctrl-o or `` to go back to the starting point (not related to the
" config)
let g:sneak#s_next = 1

" Mappings for 1-character-sneak
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" Colors for sneak matching
hi Sneak cterm=bold ctermfg=15 ctermbg=8 guibg=NONE

" Go configuration for tagbar
let g:tagbar_type_go = {
      \ 'ctagstype' : 'go',
      \ 'kinds'     : [
      \ 'p:package',
      \ 'i:imports:1',
      \ 'c:constants',
      \ 'v:variables',
      \ 't:types',
      \ 'n:interfaces',
      \ 'w:fields',
      \ 'e:embedded',
      \ 'm:methods',
      \ 'r:constructor',
      \ 'f:functions'
      \ ],
      \ 'sro' : '.',
      \ 'kind2scope' : {
      \ 't' : 'ctype',
      \ 'n' : 'ntype'
      \ },
      \ 'scope2kind' : {
      \ 'ctype' : 't',
      \ 'ntype' : 'n'
      \ },
      \ 'ctagsbin'  : 'gotags',
      \ 'ctagsargs' : '-sort -silent'
        \ }
