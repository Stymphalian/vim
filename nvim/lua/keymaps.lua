
local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

local function nmap(shortcut, command)
  map('n', shortcut, command)
end

local function imap(shortcut, command)
  map('i', shortcut, command)
end

local function vmap(shortcut, command)
  map('v', shortcut, command)
end

local function cmap(shortcut, command)
  map('c', shortcut, command)
end

local function xmap(shortcut, command)
  map('x', shortcut, command)
end

local function tmap(shortcut, command)
  map('t', shortcut, command)
end


-- " -----------------------------------------------------------------------------
-- " Custom key-mappings
-- " i - insert mode
-- " n - normal mode
-- " v - visual mode
-- " noremap - means to no-resursive map.
-- " not the "|" character at the end of the lines ends the character sequence.
-- " This is so that I can write inline comments.
-- " -----------------------------------------------------------------------------

-- "map <space> <leader>      "Map the space key to the leader key as well
-- "imap( <C-Space> <C-[>  "Ctrl+[ is the ESC key, we map it to CTRL + space
-- "imap( <C-Space> <C-x><C-o>  "Remap CTRL-space to omnicomplete
-- "imap( <C-@> <C-Space>|      "Remap <NUL> char to <CTRL-space>
imap('jk', '<C-[>')    -- Map "j + k" to ESC in insert-mode
--vmap('jk', '<C-[>')    -- "Map "j + k" to ESC in visual mode
nmap('<C-J>', '<C-E>') --"Map "CTRL + j" to line scrolling down in normal mode
nmap('<C-K>', '<C-Y>') --"Map "Ctrl + k" to line scrolling up in normal mode
nmap('HH', 'H')        --"Map "H + H" to go to the top of the visible screen
--nmap('MM', 'M')        --"Map "M + M" to go to the middle of the visible screen
nmap('LL', 'L')        --"Map "L + L" to go to the bottom of the visible scren
nmap('H', '^')          --"Map "H" to go the first character of the line
nmap('L', 'g_')         --"Map "L" to go the last charcter of the line
nmap('Y', 'mp^Y`p')     --Map "Y" to copy the full line to paste buffer

--"In insert allows you to use hjkl to move around by pressing <CTRL-blah>
--"The <C-o> in insert mode is a special hotkey which puts you back into normal
--"mode for one command and then transfers you back into insert mode.
imap('<C-h>', '<C-o>h')
imap('<C-j>', '<C-o>j')
imap('<C-k>', '<C-o>k')
imap('<C-l>', '<C-o>l')

-- Navigate buffers
nmap("<A-l>", ":bnext<CR>")
nmap("<A-h>", ":bprevious<CR>")

-- Visual --
-- Stay in visual selection mode
--vmap("<", "<gv")
--vmap(">", ">gv")

-- Move text up and down
vmap("J", ":m .+1<CR>==")
vmap("K", ":m .-2<CR>==")
xmap("J", ":move '>+1<CR>gv-gv")
xmap("K", ":move '<-2<CR>gv-gv")
--vmap("p", '"_dP')


-- Use Esc to quit the builtin terminal
tmap("<Esc>", [[<c-\><c-n>]])
-- <leader>m
nmap('<leader>mu', '<Esc>viwUea')  -- Turn the word under cursor to upper case
nmap('<leader>mT', '<Esc>b~lea')   -- Turn the current word into title case
vmap('<leader>mc', '"+y')          -- Copy to system clipboard
nmap("<leader>mq", "<cmd>x<cr>")   -- Saves the file if modified and quit
nmap("<leader>mQ", "<cmd>qa!<cr>") -- Quit all opened bufferss
nmap("<leader>mc", ":cclose<cr>")  -- Close the quickfix window
nmap("<leader>.", "<Esc><cmd>w<cr>") -- Quickly save the file
nmap("<leader>bq", ":bp <BAR> bd#<cr>") -- Close the current buffer
nmap("<leader>bc", ":cclose<cr>")  -- Close the quickfix window

-- "nnoremap <leader>ve  :e ~/.vim/.vimrc<cr>Gj|  "Open the vimrc in a new vertical
nmap('<leader>ve', ':e ~/.config/nvim/init.lua<cr>')  -- "Open the vimrc in a new vertical
nmap('<leader>vr', ':luafile $MYVIMRC<cr>| :e<cr>')  -- "Source the vimrc into the session
nmap('<leader>vee',':e ~/.vim/.vimrc<cr>|')  -- "Open the vimrc in a new vertical
nmap('<leader>vrr',':source $MYVIMRC<cr>|')  -- "Source the vimrc into the session
