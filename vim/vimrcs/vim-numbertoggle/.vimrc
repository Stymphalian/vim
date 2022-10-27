"" vim-number-toggle
""
"let g:NumberToggleTrigger="<leader>n"

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

:nnoremap <leader>n :set relativenumber!<cr>
