lua require('init')

call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()


" Remaps
let mapleader = ' ' " Map <leader> to space
nnoremap <leader>ff <cmd>Telescope find_files<cr>
