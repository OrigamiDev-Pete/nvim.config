local fn = vim.fn

vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerCompile
	augroup end
]])

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

require'gitsigns'.setup {}
require'neogit'.setup {}
require'nrunner'.setup {}

return require('packer').startup(function()
	use 'wbthomason/packer.nvim' -- Package manager
	use 'OrigamiDev-Pete/nrunner.nvim' -- My NRunner plugin
	use {
		'williamboman/nvim-lsp-installer',
		'neovim/nvim-lspconfig', -- Collection of configs for LSP
	}
	use { -- Treesitter
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use { -- Telescope
		'nvim-telescope/telescope.nvim', 
		requires={ {'nvim-lua/plenary.nvim'} }
	}
	use { -- lualine
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use { -- nvim-tree
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icons
		},
	}
	use { -- Launcher
		'goolord/alpha-nvim',
			requires = { 'kyazdani42/nvim-web-devicons' },
			config = function ()
				require'alpha'.setup(require'alpha.themes.startify'.config)
			end
	}
	use {
		'folke/which-key.nvim',
		config = function ()
			require'which-key'.setup {}
		end
	}


	use 'ziglang/zig.vim' -- Zig
	-- use 'tjdevries/nlua.nvim'

	-- autocomplete
	use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
	use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
	use 'L3MON4D3/LuaSnip' -- Snippets plugin

	use 'marko-cerovac/material.nvim' -- Material Colorscheme
	use 'shaunsingh/nord.nvim' -- Nord Colorscheme
	use 'mofiqul/dracula.nvim' -- Dracula Colorscheme

	-- Git
	use 'lewis6991/gitsigns.nvim' -- Add git gutter
	--use 'f-person/git-blame.nvim' -- Git blame virtual text
	use { -- Magit
		'TimUntersberger/neogit',
		requires = 'nvim-lua/plenary.nvim'
	}

	use 'tpope/vim-surround'
	use {
		 'numToStr/Comment.nvim',
		 config = function()
			 require('Comment').setup()
		end
	}
end)

