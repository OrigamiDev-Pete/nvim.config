
------_   ____________ _    ________  ___
-----/ | / / ____/ __ \ |  / /  _/  |/  /
----/  |/ / __/ / / / / | / // // /|_/ / 
---/ /|  / /___/ /_/ /| |/ // // /  / /  
--/_/ |_/_____/\____/ |___/___/_/  /_/   
                                       
-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4

-- tabs
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.softtabstop = 4

-- colours
vim.opt.background = 'dark'
--vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.mouse = 'a'
vim.opt.guicursor = 'n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175'

vim.opt.ignorecase = true
vim.opt.smartcase = true

require'globals'
require'autocmd'
require'plugins'
require'keymaps'
require'lsp'
require'nvim-cmp-config'
vim.cmd'colorscheme material'
require'lualine'.setup {
	options = {
		theme = 'auto'
	}
}

require'nvim-treesitter.configs'.setup {
	ensure_installed = { "lua" },
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
}

require'nvim-tree'.setup {}
