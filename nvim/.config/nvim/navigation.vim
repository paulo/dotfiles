" Fzf
let g:fzf_colors =
            \ { 'fg':    ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'Normal'],
            \ 'hl+':     ['fg', 'PreProc'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

function! s:fzf_statusline()
    " Override statusline as you like
    highlight fzf1 ctermfg=161 ctermbg=153
    highlight fzf2 ctermfg=23 ctermbg=153
    highlight fzf3 ctermfg=237 ctermbg=153
    setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" All fzf comands are preceded by fzf
let g:fzf_command_prefix = 'Fzf'

" Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Default extra key bindings
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-i': 'split',
            \ 'ctrl-s': 'vsplit' }

" Default fzf layout
let g:fzf_layout = { 'down': '~20%' }

" Augmenting Ag command using fzf#vim#with_preview function
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \                         : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \                 <bang>0)

" Enabling Rg fuzzy finding with Ripgrep as well
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg -g "!.git" -g "!_build" -g "!deps" -g "!vendor" --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
      \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
      \   <bang>0)

" nnoremap <silent> <leader>f :FzfGFiles<CR> " Only search for git files
nnoremap <silent> <leader>f :FzfFiles<CR>
nnoremap <silent> <leader>b :FzfBuffers<CR>
nnoremap <silent> <leader>wf :FzfWindows<CR>
" Supports Ag as well
nnoremap <silent> <leader>/ :Rg<CR>
nnoremap <silent> <leader>?f :FzfHistory<CR>

" Window spliting and quiting
nnoremap <silent> <leader>s :split<CR>
nnoremap <silent> <leader>v :vsplit<CR>
nnoremap <silent> <leader>q :close<CR>

" Buffer navigation helpers
nmap <Leader>j :bp<cr> " Go to the previous buffer open
nmap <Leader>k :bn<cr> " Go to the next buffer open
nmap <Leader>t :enew<cr> " Open a new empty buffer. Replaces :tabnew
nmap <Leader>q :bp <BAR> bd #<cr> " Close the current buffer and move to the previous one

" There are multiple choices available when choosing a fold method. <leader><Space> toggles a fold based on the indent level of the current cursor line
nnoremap <leader><Space> za

" Tagbar
" nmap <Leader><Leader>d :TagbarToggle

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
