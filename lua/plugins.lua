local fn = vim.fn

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

return require('packer').startup(function()
	use 'wbthomason/packer.nvim' -- Package manager
	use 'neovim/nvim-lspconfig' -- Collection of configs for LSP
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
	-- autocomplete
	use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
	use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
	use 'L3MON4D3/LuaSnip' -- Snippets plugin

	use 'shaunsingh/nord.nvim' -- Nord Colorscheme
	use 'mofiqul/dracula.nvim' -- Dracula Colorscheme
end)

-- Telescope setup
--require('telescope').setup{}

