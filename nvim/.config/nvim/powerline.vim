""""""""""""""""""""""""""""""""""""""""
" Lightline configuration (status bar) "
""""""""""""""""""""""""""""""""""""""""

function! LightlineFugitive()
  let fname = expand('%:t')
  if fname =~ 'NERD_tree'
    return 'NERD'
  elseif exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! NerdPercent()
  let fname = expand('%:t')
  if fname =~ 'NERD_tree'
    return ''
  end
  return line('.') * 100 / line('$') . '%'
endfunction

" Based of itchyny/lightline-powerful
let g:lightline = {
      \   'colorscheme': 'wombat',
      \   'active': {
      \     'left':[ [ 'mode', 'paste' ], [ 'gitbranch', 'filename' ],
      \     ],
      \     'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'filetype' ] ]
      \   },
      \   'inactive': {
      \     'left': [ [ 'filename' ] ],
      \     'right': [ [ 'lineinfo' ], [ 'percent' ] ]
      \   },
      \   'tabline': {
      \     'left': [ [ 'buffers' ] ],
      \     'right': []
      \   },
      \   'tab': {
      \     'active': [ 'tabnum', 'readonly', 'filename', 'modified' ],
      \     'inactive': [ 'tabnum', 'readonly', 'filename', 'modified' ]
      \   },
      \   'component': {
      \     'lineinfo': ' %3l:%-2v',
      \   },
      \   'component_function': {
      \     'gitbranch': 'LightlineFugitive',
      \     'percent': 'NerdPercent'
      \   }
      \ }

" Uncomment for powerline like separators
" let g:lightline.separator = {
      " \   'left': '', 'right': ''
      " \}
" let g:lightline.subseparator = {
      " \   'left': '', 'right': ''
      " \}

" if (has("termguicolors"))
  " set termguicolors
" endif

" Get rid of insert in command line
set noshowmode

" Enable true colors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Set colorscheme
colorscheme tender

" For git gutter
hi clear SignColumn
hi SignColumn ctermbg=235

"""""""""""""""""""""""""""""""""""""""
" Lightline configuration (upper bar) "
"""""""""""""""""""""""""""""""""""""""
set showtabline=1  " Hide tabline (2 to show)

" Bufferline functionality for the lightline vim plugin
" let g:lightline.tabline          = {'left': [['buffers']], 'right': []}
" let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
" let g:lightline.component_type   = {'buffers': 'tabsel'}

" if has('gui_running')
" set guioptions-=e  " Don't use GUI tabline
" endif

" From 'mengelbrecht/lightline-bufferline'
" let g:lightline#bufferline#filename_modifier = ':t'
