"" NERDTree _vimrc
""

" Keep the root of the NERD tree the directory of when vim first got opened
let g:NERDTreeChDirMode=0
let g:NERDTreeMinimalMenu=1

" Key maping to show/hide the nerd-treej
nnoremap <leader>do :NERDTreeToggle<CR>
nnoremap <leader>df :NERDTreeFocus<CR>
nnoremap <leader>dg :NERDTreeFind<CR>

" Close vim if the only buffer left is NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
