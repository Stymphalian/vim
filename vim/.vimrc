"Must have global settings
set encoding=utf-8
set fileencoding=utf-8
set nocompatible
let mapleader=','
let iswork=0

" ----------------------------------------------------------------------------
" Start Plugins!!
" ----------------------------------------------------------------------------
syntax on
filetype plugin indent on

"source ~/.vim/pack_vimrc/vim-maktaba/.vimrc          "empty
"packadd vim-maktaba

"source ~/.vim/pack_vimrc/vim-glaive/.vimrc           "empty
"packadd vim-glaive

source ~/.vim/pack_vimrc/ctrlp/.vimrc                "<leader>p
packadd ctrlp 

source ~/.vim/pack_vimrc/nerdtree/.vimrc             "<leader>d
packadd nerdtree  

source ~/.vim/pack_vimrc/nerdcommenter/.vimrc        "<leader>/
packadd nerdcommenter

source ~/.vim/pack_vimrc/vim-buffergator/.vimrc      "<leader>b
packadd vim-buffergator  

"source ~/.vim/pack_vimrc/vim-signify/.vimrc          "<leader>c
"packadd vim-signify
"
"source ~/.vim/pack_vimrc/syntastic/.vimrc            "empty
"packadd syntastic 

if !iswork
  source ~/.vim/pack_vimrc/YouCompleteMe/.vimrc        "<leader>g
  packadd YouCompleteMe
endif

"source ~/.vim/pack_vimrc/async.vim/.vimrc            "<leader>g
"packadd async.vim 

"source ~/.vim/pack_vimrc/vim-lsp/.vimrc              "<leader>g
"packadd vim-lsp  

"source ~/.vim/pack_vimrc/asyncomplete-lsp.vim/.vimrc "<leader>g
"packadd asyncomplete-lsp.vim  

"source ~/.vim/pack_vimrc/asyncomplete.vim/.vimrc     "<leader>g
"packadd asyncomplete.vim 

if !iswork 
  "source ~/.vim/pack_vimrc/rust.vim/.vimrc             "<leader>r
  "packadd rust.vim  
endif

source ~/.vim/pack_vimrc/vim-airline/.vimrc          "empty
packadd vim-airline 

source ~/.vim/pack_vimrc/vim-numbertoggle/.vimrc     "empty
packadd vim-numbertoggle  

source ~/.vim/pack_vimrc/vim-airline-themes/.vimrc   "empty
packadd vim-airline-themes 

"source ~/.vim/pack_vimrc/syntastic/.vimrc            "empty
"packadd syntastic 

source ~/.vim/pack_vimrc/ctrlp-py-matcher/.vimrc     "empty
packadd ctrlp-py-matcher

"source ~/.vim/pack_vimrc/molokai/.vimrc              "empty
"packadd molokai 

"source ~/.vim/pack_vimrc/vim-monokai/.vimrc          "empty
"packadd vim-monokai 

"source ~/.vim/pack_vimrc/vim-codefmt/.vimrc          "empty
"packadd vim-codefmt

"source ~/.vim/pack_vimrc/vim-autoformat/.vimrc       "empty
"packadd vim-autoformat

"source ~/.vim/pack_vimrc/vim-easymotion/.vimrc       "empty
"packadd vim-easymotion
"
source ~/.vim/pack_vimrc/vim-sneak/.vimrc            "empty
packadd vim-sneak

"source ~/.vim/pack_vimrc/python-mode/.vimrc           "empty
"packadd python-mode

source ~/.vim/pack_vimrc/vim-surround/.vimrc        "empty
packadd vim-surround

source ~/.vim/pack_vimrc/vim-glsl/.vimrc            "empty
packadd vim-glsl

" ----------------------------------------------------------------------------
" End Plugins!!
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

set showcmd         "show partial-comands in the bottom bar
set incsearch       "As you do '/' comamnds serach, highlight the findings
set nohlsearch      "don't highlight when '/' searching
set wildmenu        "in command-mode, pressing tab show sugests in line above
set timeoutlen=350  "time in ms to wait for a key mapped seq to complete

set nomodeline             "Disable reading modeline snppets from the file
set mouse=a                "Enable the mouse"
let loaded_matchparen=1  "Disable '{' highlight matching

set lazyredraw      "Faster macros appliction

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

command! W write      "Set the comand :W to do a write

"In insert allows you to use hjkl to move around by pressing <CTRL-blah>
"The <C-o> in insert mode is a special hotkey which puts you back into normal
"mode for one command and then transfers you back into insert mode.
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l

nnoremap <leader>ve  :e ~/.vim/.vimrc<cr>Gj|  "Open the vimrc in a new vertical 
nnoremap <leader>vr  :source $MYVIMRC<cr>|    "Source the vimrc into the session

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
  source ~/.vim/.neovimrc
endif

" ----------------------------------------------------------------------------
" Classic Vim specific settings
" ----------------------------------------------------------------------------
if !has('nvim')
  source ~/.vim/.classicvimrc
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

set pastetoggle=<leader>sp

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

