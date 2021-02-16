"" NERDCommenter _vimrc
""

" Don't attach any of the other key-mapings
let NERDCreateDefaultMappings=0

" Whether empty lines should also get commented out
let NERDCommentEmptyLines=1

" Always left-alignt the comment blocks. This makes it so that when lines are
" nested it will add the comment charctaer all aligned on the left side
let NERDDefaultAlign='left'

" Comment toggle to "/" key
nmap <leader>/ <Plug>NERDCommenterToggle
vmap <leader>/ <Plug>NERDCommenterToggle
