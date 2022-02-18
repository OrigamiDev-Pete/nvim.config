
------_   ____________ _    ________  ___
-----/ | / / ____/ __ \ |  / /  _/  |/  /
----/  |/ / __/ / / / / | / // // /|_/ / 
---/ /|  / /___/ /_/ /| |/ // // /  / /  
--/_/ |_/_____/\____/ |___/___/_/  /_/   
                                       
-- line numbers
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.numberwidth = 4

-- tabs
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.softtabstop = 4

-- colours
vim.opt.background = "dark"
vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.mouse = 'a'

vim.opt.ignorecase = true
vim.opt.smartcase = true

require('plugins')
require('keymaps')

