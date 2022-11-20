local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
--vim.cmd([[
--  augroup packer_user_config
--    autocmd!
--    autocmd BufWritePost plugins.lua source <afile> | PackerSync
--  augroup end
--]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

--local ensure_packer = function()
--  local fn = vim.fn
--  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
--  if fn.empty(fn.glob(install_path)) > 0 then
--    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
--    vim.cmd [[packadd packer.nvim]]
--     return true
--  end
--  return false
--end
--
--local packer_bootstrap = ensure_packer()

-- Packer Directories
-- /home/jordan/.local/share/nvim/site/pack/packer/start
-- /home/jordan/.cache/nvim/packer.nvim 

require('packer').startup(function(use)
  use {'wbthomason/packer.nvim', branch="master"}

  -- Good things
  use {'scrooloose/nerdtree', commit='fc85a6f'}       -- file directory in vim
  use {'scrooloose/nerdcommenter', commit='f575c18'}  -- keymaps for commenting out lines
  use {'folke/which-key.nvim', commit='61553ae'}      -- tooltip to show key-mappings

  -- Version Control
  use {'https://github.com/tpope/vim-fugitive', commit='01f3e0a'}
  use {'airblade/vim-gitgutter', commit='400a120'}

  -- Easy movement
  use {'justinmk/vim-sneak', commit='93395f5'}        -- sneak around with s<two-letter-prefix>
  use {'tpope/vim-surround', commit="3d188ed"}        -- surround things with quotes, etc
  use {'mg979/vim-visual-multi', commit='724bd53'}    -- multi-cursors like sublime
  use {'psliwka/vim-smoothie', commit='df1e324'}      -- smooth movement

  -- Debugger
  use {'puremourning/vimspector', commit='56f469c'}   -- nvim debugger all-in-one

  -- Status-line
  use {'vim-airline/vim-airline', commit='d734be8'}
  use {'vim-airline/vim-airline-themes', commit='5552f5e'}

  -- Autocomplete
  use {'williamboman/mason.nvim', commit='e14b20c'}             -- General package downloader
  use {'williamboman/mason-lspconfig.nvim', commit='a910b4d'}   -- Mason LSP downloader
  use {'neovim/nvim-lspconfig', commit='5f4b1fa'}               -- Neovim's LSP client configs
  use {'hrsh7th/nvim-cmp', commit="e94d34893"}                  -- Autocompletion plugin
  use {'hrsh7th/vim-vsnip', commit="7de8a71e5"}                 -- Autocomplete snippets 
  use {'hrsh7th/cmp-nvim-lsp', commit="3cf38d9c95"}             -- LSP source for nvim-cmp
  use {'mhartington/formatter.nvim', commit="88aa6"}            -- formatter 
  use {'Raimondi/delimitMate', commit='537a1da'}                -- bracket completion

  -- Themes
  use {'tomasr/molokai', commit='c67bdfc'}
  use {'rafi/awesome-vim-colorschemes', commit='9f96bbd'}
  use {'marko-cerovac/material.nvim', commit="e1b7fb7"}
  use {'sickill/vim-monokai', commit='6fb52e3'}

  -- Language Syntax
  use {'sheerun/vim-polyglot', commit='bc8a81d'}

  -- Telescope plugins
  use {'nvim-lua/plenary.nvim', commit='4b7e520'}
  use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate', commit='3256eb2'}
  use {'nvim-telescope/telescope-fzf-native.nvim', run='make', commit='65c0ee3'}
  use {'nvim-telescope/telescope.nvim', commit='4bd4205'}
  use {'junegunn/fzf', run = ":call fzf#install()", commit='0881a6b'}
  use {'junegunn/fzf.vim', commit='9ceac71'}

  -- Work
  -- N/A

  -- Old Plugins
  --use 'kassio/neoterm'                    -- API to interact with nvim term
  --use 'jeetsukumaran/vim-buffergator'
  --use 'https://github.com/jeffkreeftmeijer/vim-numbertoggle'
  --use 'https://github.com/inkarkat/vim-ingo-library'
  --use 'https://github.com/kamykn/popup-menu.nvim'
  --use '~/dev/lab/vim/jordan.vim'
  --use '~/dev/lab/vim/jyup.vim'
  --use '~/dev/lab/vim/swit_ch.vim'
  --use {'https://github.com/ctrlpvim/ctrlp.vim', disable=true}
  --use 'https://github.com/Stymphalian/swit_ch.vim'
  --use {'mfussenegger/nvim-dap', commit='6164368'}     -- nvim debugger
  --use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  --if packer_bootstrap then
    --require('packer').sync()
  --end
  -- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end
)

--require('jj/formatter')         -- ~/.config/nvim/lua/jj/formatter.lua 
