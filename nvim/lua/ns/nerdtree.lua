-- Keep the root of the NERD tree the directory of when vim first got opened
vim.g.NERDTreeChDirMode = 0
vim.g.NERDTreeMinimalMenu = 1

-- Key maping to show/hide the nerd-treej
local bufopts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>do', ':NERDTreeToggle<CR>', bufopts)
vim.keymap.set('n', '<leader>df', ':NERDTreeFocus<CR>', bufopts)
vim.keymap.set('n', '<leader>dg', ':NERDTreeFind<CR>', bufopts)

--Close vim if the only buffer left is NerdTree
vim.cmd([[
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
]])
