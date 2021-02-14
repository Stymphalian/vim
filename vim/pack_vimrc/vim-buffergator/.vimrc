"" vim-buffergator _vimrc
""
" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'B'

" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1

" Looper buffers
"let g:buffergator_mru_cycle_loop = 1

" Go to the previous buffer open
nmap <leader>bj :BuffergatorMruCyclePrev<cr>

" Go to the next buffer open
nmap <leader>bk :BuffergatorMruCycleNext<cr>

" Close the current viewed tab 
nmap <leader>bq :bp <BAR> bd #<cr>
