-- NERDCommenter _vimrc

--Don't attach any of the other key-mapings
vim.g.NERDCreateDefaultMappings=0

-- Whether empty lines should also get commented out
vim.g.NERDCommentEmptyLines=1

-- Always left-align the comment blocks. This makes it so that when lines are
-- nested it will add the comment charctaer all aligned on the left side
vim.g.NERDDefaultAlign='left'

-- Comment toggle to "/" key
local bufopts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>/', '<Plug>NERDCommenterToggle', bufopts)
vim.keymap.set('v', '<leader>/', '<Plug>NERDCommenterToggle', bufopts)
