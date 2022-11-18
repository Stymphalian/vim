-- vim-number-toggle

vim.cmd([[ 
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
]])

local bufopts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>n', ':set relativenumber!<cr>', bufopts)
