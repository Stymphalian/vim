"Must have global settings
set encoding=utf-8
set fileencoding=utf-8
set nocompatible
let mapleader=','
let iswork=0

" ----------------------------------------------------------------------------
" plugins start
" ----------------------------------------------------------------------------
syntax on
filetype plugin indent on

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')

"Plug 'https://github.com/inkarkat/vim-ingo-library'
"Plug 'https://github.com/kamykn/popup-menu.nvim'
"Plug '~/dev/lab/vim/jordan.vim'
"Plug '~/dev/lab/vim/jyup.vim'
"Plug '~/dev/lab/vim/swit_ch.vim'

" Good things
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/scrooloose/nerdcommenter'
Plug 'https://github.com/jeetsukumaran/vim-buffergator'
Plug 'https://github.com/jeffkreeftmeijer/vim-numbertoggle'
Plug 'https://github.com/Stymphalian/swit_ch.vim'

" Version Control
"Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/airblade/vim-gitgutter'

" Easy movement
Plug 'https://github.com/justinmk/vim-sneak'
Plug 'https://github.com/tpope/vim-surround'

" Status-line
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'

" Autocomplete
"Plug 'https://github.com/ycm-core/YouCompleteMe'
"Plug 'https://github.com/FelikZ/ctrlp-py-matcher'
Plug 'https://github.com/neoclide/coc.nvim/', {'branch': 'release'}
Plug 'https://github.com/github/copilot.vim', {'branch': 'release'}

" Themes
Plug 'https://github.com/tomasr/molokai'
Plug 'https://github.com/sickill/vim-monokai'

" Language Syntax
Plug 'https://github.com/sheerun/vim-polyglot'
"Plug 'https://github.com/tikhomirov/vim-glsl'
"Plug 'https://github.com/rust-lang/rust.vim'
"Plug 'https://github.com/tpope/vim-ragtag'

" Telescope plugins
" Only works for nvim so should be commented out if using normal vim
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim'

" Other plugins I've used before, but don't need right now
"Plug 'https://github.com/google/vim-maktaba'
"Plug 'https://github.com/google/vim-glaive'
"Plug 'https://github.com/mhinz/vim-signify'
"Plug 'https://github.com/vim-syntastic/syntastic'
"Plug 'https://github.com/easymotion/vim-easymotion'
"Plug 'https://github.com/prabirshrestha/vim-lsp'
"Plug 'https://github.com/prabirshrestha/async.vim'
"Plug 'https://github.com/prabirshrestha/asyncomplete.vim'
"Plug 'https://github.com/prabirshrestha/asyncomplete-lsp.vim'
"Plug 'https://github.com/google/vim-codefmt'
"Plug 'https://github.com/Chiel92/vim-autoformat'

call plug#end()

" plugins vimrcs
source ~/.vim/vimrcs/ctrlp/.vimrc                 "<leader>m
source ~/.vim/vimrcs/nerdtree/.vimrc              "<leader>d
source ~/.vim/vimrcs/nerdcommenter/.vimrc         "<leader>/
source ~/.vim/vimrcs/vim-buffergator/.vimrc       "<leader>b
source ~/.vim/vimrcs/telescope.nvim/.vimrc        "<leader>f
source ~/.vim/vimrcs/vim-numbertoggle/.vimrc      "empty
source ~/.vim/vimrcs/vim-sneak/.vimrc             "empty
source ~/.vim/vimrcs/vim-surround/.vimrc          "empty
source ~/.vim/vimrcs/vim-airline/.vimrc           "empty
source ~/.vim/vimrcs/vim-airline-themes/.vimrc    "empty
source ~/.vim/vimrcs/coc.nvim/.vimrc              "<leader>g
source ~/.vim/vimrcs/copilot.vim/.vimrc          "<leader>g
"source ~/.vim/vimrcs/YouCompleteMe/.vimrc        "<leader>g
"source ~/.vim/vimrcs/ctrlp-py-matcher/.vimrc     "empty
source ~/.vim/vimrcs/vim-polyglot/.vimrc          "empty
source ~/.vim/vimrcs/swit_ch.vim/.vimrc          "empty

" ----------------------------------------------------------------------------
" Plugins End
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" Personal settings
" ----------------------------------------------------------------------------
set hidden       "When a buffer is abandoned then unload the buffer
set autoread     "auto-reload the file if it is detectedd as changed
"set autochdir    "change to the directoy which contains the open file
if !iswork
  set path+=**     "recursivelly do a find for all subdirectories
endif

set smarttab     "when tab is pressed use tabstop number of spaces
set tabstop=2    "number of spaces a tab in the file counts for
set shiftwidth=2 "number of spaces to use for each auto-indent
set expandtab    "expand a tab characters into the space chars
set autoindent   "automatically indent when starting a new line
set smartindent  "do c-like indenting when possible
set nowrap       "don't wrap the lines if it is longer than the split

"makes insert-mode backspace work as expected
"makes insert-mode arrow keys work as expected
set backspace=indent,eol,start  whichwrap+=<,>,[,],h,l 
set listchars=tab:→\ ,extends:›,precedes:‹,trail:·,eol:↲,nbsp:␣,space:·

set history=50           "keep up to 50 lines in the command-mode history
if !iswork 
  set nobackup             "Do not create a backup before over-writing a file
  set backupdir=~/.vimbak  "Where to write backups to if you do write them
  set directory=~/.vimswap "Where to keep vim .swap files
  set undodir=~/.vimundo   "Where to keep vim undo files
endif

set ruler               "show the line and columns number in the bottom status
set colorcolumn=80,100  "color column 80 and column 100
set number              "print the line number in the left-margin
set numberwidth=2       "number of columns to use to dispaly the number
set cursorline          "highlight the linet he cursor is currently on
set signcolumn=yes

set showcmd         "show partial-comands in the bottom bar
set incsearch       "As you do '/' comamnds serach, highlight the findings
set nohlsearch      "don't highlight when '/' searching
set wildmenu        "in command-mode, pressing tab show sugests in line above
set timeoutlen=350  "time in ms to wait for a key mapped seq to complete

set nomodeline             "Disable reading modeline snppets from the file
set mouse=a                "Enable the mouse"
let loaded_matchparen=1  "Disable '{' highlight matching

set lazyredraw      "Faster macros appliction

set pastetoggle=<leader>sp

" -----------------------------------------------------------------------------
" Custom key-mappings
" i - insert mode
" n - normal mode
" v - visual mode
" noremap - means to no-resursive map.
" not the "|" character at the end of the lines ends the character sequence.
" This is so that I can write inline comments.
" -----------------------------------------------------------------------------

"map <space> <leader>      "Map the space key to the leader key as well
"inoremap <C-Space> <C-[>  "Ctrl+[ is the ESC key, we map it to CTRL + space
"inoremap <C-Space> <C-x><C-o>  "Remap CTRL-space to omnicomplete
"inoremap <C-@> <C-Space>|      "Remap <NUL> char to <CTRL-space>
inoremap jk <C-[>|    "Map "j + k" to ESC in insert-mode
"inoremap kj <C-[>|    "Map "j + k" to ESC in insert-mode
vnoremap jk <C-[>|    "Map "j + k" to ESC in visual mode
"vnoremap kj <C-[>|    "Map "j + k" to ESC in visual mode
nnoremap <C-J> <C-E>| "Map "CTRL + j" to line scrolling down in normal mode
nnoremap <C-K> <C-Y>| "Map "Ctrl + k" to line scrolling up in normal mode
nnoremap HH H|        "Map "H + H" to go to the top of the visible screen
nnoremap MM M|        "Map "M + M" to go to the middle of the visible screen
nnoremap LL L|        "Map "L + L" to go to the bottom of the visible scren
nnoremap H ^|         "Map "H" to go the first character of the line
nnoremap L $|         "Map "L" to go the last charcter of the line

"In insert allows you to use hjkl to move around by pressing <CTRL-blah>
"The <C-o> in insert mode is a special hotkey which puts you back into normal
"mode for one command and then transfers you back into insert mode.
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l

"Let me easily switch between cpp and header files
"Only works for files in the current directory but should be find for now
"augroup jordan_c_group
"  autocmd!
"  "autocmd FileType cpp nnoremap <buffer> <leader>lc :e %:r.cpp<CR>
"  "autocmd FileType cpp nnoremap <buffer> <leader>lt :e %:r_test.cpp<CR>
"  "autocmd FileType cpp nnoremap <buffer> <leader>lh :e %:r.h<CR>
"  autocmd FileType cpp nnoremap <buffer> <leader>lc :execute GetOtherFile('impl')<CR>
"  autocmd FileType cpp nnoremap <buffer> <leader>lt :execute GetOtherFile('test')<CR>
"  autocmd FileType cpp nnoremap <buffer> <leader>lh :execute GetOtherFile('header')<CR>
"augroup END

" Stuff
"iabbrev <// </<C-X><C-O>

"nnoremap <leader>ve  :e ~/.vim/.vimrc<cr>Gj|  "Open the vimrc in a new vertical 
nnoremap <leader>ve  :e ~/.vim/.vimrc<cr>|  "Open the vimrc in a new vertical 
nnoremap <leader>vr  :source $MYVIMRC<cr>|  "Source the vimrc into the session

" ---------------------------------------------------------------------------
" Commands
" ---------------------------------------------------------------------------
command! W write      "Set the comand :W to do a write

" ---------------------------------------------------------------------------
" Autocmds
" ---------------------------------------------------------------------------
if !iswork
  augroup rust_autocmds
    autocmd FileType rust iabbrev <buffer> jjlog  println!("@@@@ {:?}",)<left>
  augroup END
endif

" ---------------------------------------------------------------------------
" Make things look fancy.
" ---------------------------------------------------------------------------
syntax enable
colorscheme monokai
colorscheme molokai

"-----------------------------------------------------------------------------
" Neovim specific settings
" ----------------------------------------------------------------------------
if has('nvim')
  "source ~/.vim/.neovimrc
  "Use system clipbaord 
  "set clipboard+=unnamedplus
  "Map the escape sequence to "j + k"
  tnoremap jk  <C-\><C-n>|                           
  "Run the last command from the terminal
  tnoremap <leader>m  i<up><cr><cr>|                 
  "paste what you last yanked and then run the previous command
  tnoremap <leader>mp i<up> <C-\><C-n>pi<cr><cr>|     
endif

" ----------------------------------------------------------------------------
" Classic Vim specific settings
" ----------------------------------------------------------------------------
if !has('nvim')
  "source ~/.vim/.classicvimrc
  " Make "%" command matching better
  packadd matchit
endif

" ----------------------------------------------------------------------------
" On the spot vim commands
" ----------------------------------------------------------------------------
" <op> iB  -- apply operator on inner block
" <op> aB  -- apply operator on block
" <op> i"  -- apply operator on charcters between quote marks
" <op> a"  -- apply operator on charcters between quote marks
" ;cw      -- show quickfix window
" :ccl     -- close quickfix window
" :grep! <vim regex pattern>   -- grep for a file

" in command-mode, search mode etc use <CTRL-R> to print the contents of a 
" register
" v - visual mode
" y - yank the selected text
" / - enter search mode
" <CTRL-R> - paste contents of register
" <search register>
"sudjj

" sudo apt-get install vim-gtk to have a version of vim which enables the
" clipboard
" re-mapping Ctrl+c, ctrl-v for clipboard copying
"vmap <C-c> "+yi
"vmap <C-x> "+c
"vmap <C-v> c<ESC>"+p
"imap <C-v> <ESC>"+pa
" :echo g:SuperTabDefaultCompletionType

