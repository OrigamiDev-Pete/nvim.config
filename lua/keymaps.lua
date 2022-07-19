local function keymap(mode, keys, command, opts)
	vim.api.nvim_set_keymap(mode, keys, command, opts)
end

vim.g.mapleader = ' '

keymap('n', '<c-_>', '<cmd>lua require\'commentor\'.comment()<CR>', {noremap = true})
-- Telescope
--keymap('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<CR>', {noremap = true})
keymap('n', '<c-p>', '<cmd>lua require("telescope.builtin").find_files()<CR>', {noremap = true})
-- keymap('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<CR>', {noremap = true})
-- keymap('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<CR>', {noremap = true})
 
keymap('n', '<c-l>', '<c-w><c-l>', {noremap = true})
keymap('n', '<c-h>', '<c-w><c-h>', {noremap = true})
keymap('n', '<c-j>', '<c-w><c-j>', {noremap = true})
keymap('n', '<c-k>', '<c-w><c-k>', {noremap = true})

-- keymap('n', '<leader>`', '<cmd>vsplit | vertical resize 80 | terminal<CR>', {noremap = true})
-- keymap('t', '<leader>`', [[<c-\><c-n><cmd>q<CR>]], {noremap = true})
keymap('n', '<c-b>', '<cmd>NvimTreeToggle<CR>', {noremap = true})

-- keymap('n', '<leader>cd', '<cmd>cd %:h<CR>', {noremap = true})

local which_key = require'which-key'
which_key.register({
	['<leader>c'] = { '<cmd>cd %:h<CR>', 'Change Working Directory' },
	['<leader>`'] = { '<cmd>vsplit | vertical resize 80 | terminal<CR>', 'Open Terminal' },
	['<leader>f'] = {
		name = 'Telescope',
		g = { '<cmd>lua require("telescope.builtin").live_grep()<CR>', 'Live Grep' },
		b = { '<cmd>lua require("telescope.builtin").buffers()<CR>', 'Open Buffers' },
	},
})

which_key.register({
	['<leader>`'] = { [[<c-\><c-n><cmd>q<CR>]], 'Close Terminal' },
}, { mode = 't' })
