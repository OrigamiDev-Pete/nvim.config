-- local function keymap(mode, keys, command, opts)
-- 	vim.api.nvim_set_keymap(mode, keys, command, opts)
-- end
local keymap = vim.keymap

vim.g.mapleader = ' '

keymap.set('n', '<c-_>', 'gcc', {})
keymap.set('n', '<c-z>', '<Nop>', {})

-- Telescope
keymap.set('n', '<leader>ff', function() require("telescope.builtin").find_files() end)
keymap.set('n', '<c-p>', function() require("telescope.builtin").find_files() end)
keymap.set('n', '<leader>fg', function() require("telescope.builtin").live_grep() end)
keymap.set('n', '<leader>fb', function() require("telescope.builtin").buffers() end)

keymap.set('n', '<c-l>', '<c-w><c-l>')
keymap.set('n', '<c-h>', '<c-w><c-h>')
keymap.set('n', '<c-j>', '<c-w><c-j>')
keymap.set('n', '<c-k>', '<c-w><c-k>')

-- keymap('n', '<leader>`', '<cmd>vsplit | vertical resize 80 | terminal<CR>', {noremap = true})
-- keymap('t', '<leader>`', [[<c-\><c-n><cmd>q<CR>]], {noremap = true})
keymap.set('t', '<ESC>', [[<c-\><c-n>]])
keymap.set('n', '<c-b>', '<cmd>NvimTreeToggle<CR>')

-- keymap('n', '<leader>cd', '<cmd>cd %:h<CR>', {noremap = true})

local which_key = require'which-key'
which_key.register({
	['<leader>c'] = { '<cmd>cd %:h<CR>', 'Change Working Directory' },
	['<leader>`'] = { '<cmd>vsplit<CR> <c-w><c-l> <cmd>vertical resize 80<CR> <cmd>terminal<CR>', 'Open Terminal' },
	['<leader>x'] = { '<cmd>w<CR> <cmd>source %<CR>', 'Run current file' },
	['<leader>f'] = {
		name = 'Telescope',
		g = { '<cmd>lua require("telescope.builtin").live_grep()<CR>', 'Live Grep' },
		b = { '<cmd>lua require("telescope.builtin").buffers()<CR>', 'Open Buffers' },
		h = { '<cmd>lua require("telescope.builtin").help_tags()<CR>', 'Grep Help' },
	},
})

which_key.register({
	['`'] = { [[<c-\><c-n><cmd>q<CR>]], 'Close Terminal' },
}, { mode = 't' })
