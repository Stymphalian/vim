HOME = os.getenv("HOME");
IS_WORK = 0

vim.o.compatible = false
vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
vim.o.syntax = true
vim.g.mapleader = ','

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  --use 'https://github.com/inkarkat/vim-ingo-library'
  --use 'https://github.com/kamykn/popup-menu.nvim'
  --use '~/dev/lab/vim/jordan.vim'
  --use '~/dev/lab/vim/jyup.vim'
  --use '~/dev/lab/vim/swit_ch.vim'

  -- Good things
  --use {'https://github.com/ctrlpvim/ctrlp.vim', disable=true}
  use 'scrooloose/nerdtree'
  use 'scrooloose/nerdcommenter'
  use 'jeetsukumaran/vim-buffergator'
  use 'jeffkreeftmeijer/vim-numbertoggle'
  use "folke/which-key.nvim"                -- tooltip to show key-mappings
  -- use 'https://github.com/Stymphalian/swit_ch.vim'

  -- Version Control
  -- use 'https://github.com/tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'

  -- Easy movement
  use 'justinmk/vim-sneak'
  use 'tpope/vim-surround'

  -- Status-line
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  -- Autocomplete
  --use {'https://github.com/neoclide/coc.nvim/', branch='release'}
  use 'williamboman/mason.nvim'             -- General package downloader
  use 'williamboman/mason-lspconfig.nvim'   -- Mason LSP downloader
  use 'neovim/nvim-lspconfig'               -- Neovim's LSP client configs
  use 'hrsh7th/nvim-cmp'                    -- Autocompletion plugin
  use 'hrsh7th/vim-vsnip'                   -- Autocomplete snippets 
  use 'hrsh7th/cmp-nvim-lsp'                -- LSP source for nvim-cmp

  -- Themes
  use 'https://github.com/tomasr/molokai'
  use 'marko-cerovac/material.nvim'
  --use 'https://github.com/sickill/vim-monokai'

  -- Language Syntax
  use 'sheerun/vim-polyglot'
  -- use 'https://github.com/tikhomirov/vim-glsl'
  -- use 'https://github.com/rust-lang/rust.vim'
  -- use 'https://github.com/tpope/vim-ragtag'

  -- Telescope plugins
  use 'nvim-lua/plenary.nvim'
  use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'}
  use {'nvim-telescope/telescope-fzf-native.nvim', run='make' }
  use 'nvim-telescope/telescope.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

require('lsp-config')             -- ~/.config/nvim/lua/lsp-config.lua
require('lsp-cmp')                -- ~/.config/nvim/lua/lsp-cmp.lua
require("which-key").setup{}
require('material').setup()
vim.cmd('colorscheme material')
--vim.lsp.set_log_level("debug")

-- Plugin vimrcs
vim.cmd('source ~/.vim/vimrcs/nerdtree/.vimrc')              --"<leader>d
vim.cmd('source ~/.vim/vimrcs/nerdcommenter/.vimrc')         --"<leader>/
vim.cmd('source ~/.vim/vimrcs/vim-buffergator/.vimrc')       --"<leader>b
vim.cmd('source ~/.vim/vimrcs/vim-numbertoggle/.vimrc')      --"empty
vim.cmd('source ~/.vim/vimrcs/vim-sneak/.vimrc')             --"empty (default s <>)
vim.cmd('source ~/.vim/vimrcs/vim-surround/.vimrc')          --"empty (default <cyd>s<>)
vim.cmd('source ~/.vim/vimrcs/vim-airline/.vimrc')           --"empty
vim.cmd('source ~/.vim/vimrcs/telescope.nvim/.vimrc')        --"<leader>f
--vim.cmd('source ~/.vim/vimrcs/ctrlp/.vimrc')                 --"<leader>m
--vim.cmd('source ~/.vim/vimrcs/coc.nvim/.vimrc')              --"<leader>g


-- ----------------------------------------------------------------------------
-- Personal settings
-- ----------------------------------------------------------------------------
vim.o.hidden = true       --When a buffer is abandoned then unload the buffer
vim.o.autoread  = true    --auto-reload the file if it is detectedd as changed
--vim.o.autochdir         -- change to the directoy which contains the open file

vim.o.smarttab = true    -- "when tab is pressed use tabstop number of spaces
vim.o.tabstop=2          -- "number of spaces a tab in the file counts for
vim.o.shiftwidth=2       -- "number of spaces to use for each auto-indent
vim.o.expandtab  = true  -- "expand a tab characters into the space chars
vim.o.autoindent = true  -- "automatically indent when starting a new line
vim.o.smartindent = true -- "do c-like indenting when possible
vim.o.wrap = false       -- "don't wrap the lines if it is longer than the split

-- "makes insert-mode backspace work as expected
-- "makes insert-mode arrow keys work as expected
vim.o.backspace="indent,eol,start"
vim.o.whichwrap = vim.o.whichwrap .. "<,>,[,],h,l"
vim.o.listchars="tab:→ ,extends:›,precedes:‹,trail:·,eol:↲,nbsp:␣,space:·"

vim.o.history=50            --keep up to 50 lines in the command-mode history

if not IS_WORK then
  vim.o.backup = false              -- "Do not create a backup before over-writing a file
  vim.o.backupdir=HOME.."/.vimbak"  -- "Where to write backups to if you do write them
  vim.o.directory=HOME.."/.vimswap" -- "Where to keep vim .swap files
  vim.o.undodir=HOME.."/.vimundo"   -- "Where to keep vim undo files
end

vim.o.ruler=true               -- "show the line and columns number in the bottom status
vim.o.colorcolumn="80,100"     -- "color column 80 and column 100
vim.o.number=true              -- "print the line number in the left-margin
vim.o.numberwidth=2            -- "number of columns to use to dispaly the number
vim.o.cursorline=true          -- "highlight the linet he cursor is currently on
vim.o.signcolumn="yes"

vim.o.showcmd=true         -- "show partial-comands in the bottom bar
vim.o.incsearch=true       -- "As you do '/' comamnds serach, highlight the findings
vim.o.hlsearch=false       -- "don't highlight when '/' searching
vim.o.wildmenu=true        -- "in command-mode, pressing tab show sugests in line above
vim.o.timeoutlen=350       -- "time in ms to wait for a key mapped seq to complete

vim.o.modeline = false       -- "Disable reading modeline snppets from the file
vim.o.mouse="a"              -- "Enable the mouse"
--let loaded_matchparen=1    -- "Disable '{' highlight matching
vim.o.lazyredraw=true        -- "Faster macros appliction

vim.o.foldenable=false
vim.o.foldmethod='indent'    -- " fold based on indent
vim.o.foldnestmax=2          -- " helps make sure methods inside a class aren't folded


function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

function vmap(shortcut, command)
  map('v', shortcut, command)
end

function cmap(shortcut, command)
  map('c', shortcut, command)
end

function tmap(shortcut, command)
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
imap('jk', '<C-[>|')    -- Map "j + k" to ESC in insert-mode
vmap('jk', '<C-[>|')    -- "Map "j + k" to ESC in visual mode
nmap('<C-J>', '<C-E>|') --"Map "CTRL + j" to line scrolling down in normal mode
nmap('<C-K>', '<C-Y>|') --"Map "Ctrl + k" to line scrolling up in normal mode
nmap('HH', 'H|')        --"Map "H + H" to go to the top of the visible screen
nmap('MM', 'M|')        --"Map "M + M" to go to the middle of the visible screen
nmap('LL', 'L|')        --"Map "L + L" to go to the bottom of the visible scren
nmap('H', '^')          --"Map "H" to go the first character of the line
nmap('L', 'g_')         --"Map "L" to go the last charcter of the line
--nmap('L', 'g_')       --"Map "L" to go the last charcter of the line

--"In insert allows you to use hjkl to move around by pressing <CTRL-blah>
--"The <C-o> in insert mode is a special hotkey which puts you back into normal
--"mode for one command and then transfers you back into insert mode.
imap('<C-h>', '<C-o>h')
imap('<C-j>', '<C-o>j')
imap('<C-k>', '<C-o>k')
imap('<C-l>', '<C-o>l')


-- Use Esc to quit the builtin terminal
tmap("<Esc>", [[<c-\><c-n>]])
-- Turn the word under cursor to upper case
nmap('<leader>mu', '<Esc>viwUea')
-- Turn the current word into title case
nmap('<leader>mt', '<Esc>b~lea')
-- Saves the file if modified and quit
vim.keymap.set("n", "<leader>q", "<cmd>x<cr>", { silent = true, desc = "quit current window" })
-- Quit all opened buffers
vim.keymap.set("n", "<leader>Q", "<cmd>qa!<cr>", { silent = true, desc = "quit nvim" })

-- "Let me EASILY switch between cpp and header files
-- "Only works for files in the current directory but should be find for now
-- "augroup jordan_c_group
-- "  autocmd!
-- "  "autocmd FileType cpp nnoremap <buffer> <leader>lc :e %:r.cpp<CR>
-- "  "autocmd FileType cpp nnoremap <buffer> <leader>lt :e %:r_test.cpp<CR>
-- "  "autocmd FileType cpp nnoremap <buffer> <leader>lh :e %:r.h<CR>
-- "  autocmd FileType cpp nnoremap <buffer> <leader>lc :execute GetOtherFile('impl')<CR>
-- "  autocmd FileType cpp nnoremap <buffer> <leader>lt :execute GetOtherFile('test')<CR>
-- "  autocmd FileType cpp nnoremap <buffer> <leader>lh :execute GetOtherFile('header')<CR>
-- "augroup END
-- 
-- " Stuff
-- "iabbrev <// </<C-X><C-O>
-- ccl - close quickfix window
-- <c-w><c-z> - close preview window
-- <c-w> z - close preview window

-- "nnoremap <leader>ve  :e ~/.vim/.vimrc<cr>Gj|  "Open the vimrc in a new vertical 
nmap('<leader>ve', ':e ~/.config/nvim/init.lua<cr>')  -- "Open the vimrc in a new vertical 
nmap('<leader>vr', ':luafile $MYVIMRC<cr>| :e<cr>')  -- "Source the vimrc into the session
nmap('<leader>vee',':e ~/.vim/.vimrc<cr>|')  -- "Open the vimrc in a new vertical 
nmap('<leader>vrr',':source $MYVIMRC<cr>|')  -- "Source the vimrc into the session