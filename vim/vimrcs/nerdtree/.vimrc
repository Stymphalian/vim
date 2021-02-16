"" NERDTree _vimrc
""

" Keep the root of the NERD tree the directory of when vim first got opened
let NERDTreeChDirMode=2

" Key maping to show/hide the nerd-treej
nnoremap <leader>do :NERDTreeToggle<CR>
nnoremap <leader>df :NERDTreeFocus<CR>

" Close vim if the only buffer left is NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
