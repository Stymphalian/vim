HOME = os.getenv("HOME");
IS_WORK = false;
IS_HOME = not IS_WORK;

vim.o.compatible = false
vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
vim.o.syntax = true
vim.g.mapleader = ','

require('plugins');            -- ~/.config/nvim/lua/plugins.lua
require('options');            -- ~/.config/nvim/lua/options.lua
require('colorschemes');       -- ~/.config/nvim/lua/colorschemes.lua

-- Plugin vimrcs
require('ns/nerdtree')         -- ~/.config/nvim/lua/ns/nerdtree.lua         -- <leader>d
require('ns/nerdcommenter')    -- ~/.config/nvim/lua/ns/nerdcommenter.lua    -- <leader>/
require('ns/vim-numbertoggle') -- ~/.config/nvim/lua/ns/vim-numbertoggle.lua
require('ns/vim-sneak')        -- ~/.config/nvim/lua/ns/vim-sneak.lua        -- empty (defualt s <>)
require('ns/vim-surround')     -- ~/.config/nvim/lua/ns/vim-surround.lua     -- empty (defualt <cyd>s<>)
require('ns/vim-airline')      -- ~/.config/nvim/lua/ns/vim-airline.lua      -- empty
require('ns/dap')              -- ~/.config/nvim/lua/ns/dap.lua              -- <leader>e
if IS_HOME then
  require('fzf')               -- ~/.config/nvim/lua/fzf.lua                 -- <leader>p
  require('ns/telescope')      -- ~/.config/nvim/lua/jj/telescope.lua        -- <leader>p
end
require('lsp-config')          -- ~/.config/nvim/lua/lsp-config.lua,         -- <leader>l
require('lsp-cmp')             -- ~/.config/nvim/lua/lsp-cmp.lua     
require('delimitMate')         -- ~/.config/nvim/lua/delimitMate.lua  
require('jj/run-command')      -- ~/.config/nvim/lua/jj/run-command.lua      -- <leader>m
require('jj/ctrl_d')           -- ~/.config/nvim/lua/jj/ctrl_d.lua           -- <leader>m
require("which-key").setup()

-- Work
if IS_WORK then
  require('coursehero')        -- ~/.config/nvim/lua/coursehero.lua          -- <leader>w
end

require('keymaps');            -- ~/.config/nvim/lua/keymaps.lua

------------------------------------------------------
-- NOTES
------------------------------------------------------
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
--
-- Simulating vscode/sublime ctrl-d behavior in Vim
--    visual mode select the text you want to search
--    yank the text
--    in search mode <C-r>"  (ctrl_r + ") to output the last yanked text
--    click enter to search
--    now the text is in your search, so you can use n,N to navigate
--    if you want to make edits and apply them to every instance
--    create a macro (qa), make the edit in once instance
--    use n (or N) to search for the next instance
--    type @a to apply the macro
--    For subsequent ones, use @@ to apply the last macro
--
-- To search for just the word surround the search term with \< "word" \>
--
-- quickfix window
-- preview window
-- help window
--
-- set cmdheight=1 when NERDtree fucks you up
--
-- close all buffers except this one
-- :%bd|e#  
--
-- {visual} g<Ctrl-a>  -- increment numbers from a visual selection 
