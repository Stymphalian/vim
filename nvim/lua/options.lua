-- ----------------------------------------------------------------------------
-- Personal settings
-- ----------------------------------------------------------------------------
vim.o.hidden = true       --When a buffer is abandoned then unload the buffer
vim.o.autoread = true     --auto-reload the file if it is detectedd as changed
vim.o.autochdir = false   -- change to the directoy which contains the open file

vim.o.smarttab = true    -- "when tab is pressed use tabstop number of spaces
vim.o.tabstop = 2          -- "number of spaces a tab in the file counts for
vim.o.shiftwidth = 2       -- "number of spaces to use for each auto-indent
vim.o.expandtab = true  -- "expand a tab characters into the space chars
vim.o.autoindent = true  -- "automatically indent when starting a new line
vim.o.smartindent = true -- "do c-like indenting when possible
vim.o.wrap = false       -- "don't wrap the lines if it is longer than the split
vim.o.fixendofline = false -- fix the end of line

-- "makes insert-mode backspace work as expected
-- "makes insert-mode arrow keys work as expected
vim.o.backspace="indent,eol,start"
vim.o.whichwrap = vim.o.whichwrap .. "<,>,[,],h,l"
vim.o.listchars="tab:→ ,extends:›,precedes:‹,trail:·,eol:↲,nbsp:␣,space:·"

vim.o.history=50                  -- keep up to 50 lines in the command-mode history
vim.o.backup = false              -- "Do not create a backup before over-writing a file
vim.o.backupdir=HOME.."/.vimbak"  -- "Where to write backups to if you do write them
vim.o.directory=HOME.."/.vimswap" -- "Where to keep vim .swap files
vim.o.undodir=HOME.."/.vimundo"   -- "Where to keep vim undo files

vim.o.ruler=true               -- "show the line and columns number in the bottom status
vim.o.colorcolumn="80,100"     -- "color column 80 and column 100
vim.o.number=true              -- "print the line number in the left-margin
vim.o.numberwidth=2            -- "number of columns to use to dispaly the number
vim.o.cursorline=true          -- "highlight the line he cursor is currently on
vim.o.signcolumn="no"

vim.o.showcmd=true         -- "show partial-comands in the bottom bar
vim.o.incsearch=true       -- "As you do '/' comamnds serach, highlight the findings
vim.o.hlsearch=false       -- "don't highlight when '/' searching
vim.o.wildmenu=true        -- "in command-mode, pressing tab show sugests in line above
vim.o.timeoutlen=350       -- "time in ms to wait for a key mapped seq to complete

vim.o.modeline = false       -- "Disable reading modeline snppets from the file
vim.o.mouse="a"              -- "Enable the mouse"
--let loaded_matchparen=1    -- "Disable '{' highlight matching
vim.o.lazyredraw=true        -- "Faster macros appliction
vim.o.redrawtime=10000       -- increase redraw time for syntax highlighting
vim.o.laststatus=2           -- last window has a status line

vim.o.foldenable=true
vim.o.foldmethod='manual'    -- " fold based on indent
vim.o.foldnestmax=2          -- " helps make sure methods inside a class aren't folded

-- save a view so that we can keep folds loaded upon reopening vim
vim.cmd([[
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
]])
