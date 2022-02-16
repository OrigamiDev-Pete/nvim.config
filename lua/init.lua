-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2

-- tabs
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.softtabstop = 4

-- colours
vim.opt.background = 'light'

vim.opt.scrolloff = 8

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keymaps
local function keymap(mode, keys, command, opts)
	vim.api.nvim_set_keymap(mode, keys, command, opts)
end

vim.g.mapleader = ' '

keymap('n', '<c-_>', '<cmd>lua require\'commentor\'.comment()<CR>', {noremap = true})
-- Telescope
keymap('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<CR>', {noremap = true})
keymap('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<CR>', {noremap = true})
keymap('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<CR>', {noremap = true})

keymap('n', '<c-l>', '<c-w><c-l>', {noremap = true})
keymap('n', '<c-h>', '<c-w><c-h>', {noremap = true})
keymap('n', '<c-j>', '<c-w><c-j>', {noremap = true})
keymap('n', '<c-k>', '<c-w><c-k>', {noremap = true})

