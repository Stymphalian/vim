--vim.g.airline_powerline_fonts = 1
--vim.g.airline_theme='molokai'
vim.g["airline#extensions#tabline#enabled"] = 1
vim.g["airline#extensions#tabline#show_buffers"] = 1
vim.g["airline#extensions#tabline#show_tabs"] = 1
vim.g["airline#extensions#tabline#tab_nr_type"] = 1 -- tab number
vim.g["airline#extensions#tabline#show_tab_nr"] = 1
vim.g["airline#extensions#tabline#buffer_nr_show"] = 1
vim.g["airline#extensions#tabline#fnamemod"] = ':t'
vim.g["airline#extensions#tabline#buffer_idx_mode"] = 1

local bufopts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>1', '<Plug>AirlineSelectTab1', bufopts);
vim.keymap.set('n', '<leader>2', '<Plug>AirlineSelectTab2', bufopts);
vim.keymap.set('n', '<leader>3', '<Plug>AirlineSelectTab3', bufopts);
vim.keymap.set('n', '<leader>4', '<Plug>AirlineSelectTab4', bufopts);
vim.keymap.set('n', '<leader>5', '<Plug>AirlineSelectTab5', bufopts);
vim.keymap.set('n', '<leader>6', '<Plug>AirlineSelectTab6', bufopts);
vim.keymap.set('n', '<leader>7', '<Plug>AirlineSelectTab7', bufopts);
vim.keymap.set('n', '<leader>8', '<Plug>AirlineSelectTab8', bufopts);
vim.keymap.set('n', '<leader>9', '<Plug>AirlineSelectTab9', bufopts);
