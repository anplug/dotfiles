vim.o.number = true
vim.o.hlsearch = true
vim.o.ruler = true
vim.o.mouse = ""
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.cmdheight = 1
vim.o.updatetime = 500
vim.o.termguicolors = true

vim.wo.colorcolumn = "107"

vim.cmd [[noswapfile]]

require('packer').startup(function()
  use { 'wbthomason/packer.nvim' }
  use { 'rafi/awesome-vim-colorschemes' }
  use { 'matze/vim-move' }
  use { 'vijaymarupudi/nvim-fzf' }
  use { 'ibhagwan/fzf-lua' }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }
end)

-- Colorschemes
-- Dark: one, afterglow, challenger_deep, dogrun, gotham
-- Light: flattened
vim.cmd [[colorscheme molokai]]

-- vim-move

vim.cmd [[
  let g:move_key_modifier = 'C'
]]

-- fzf

vim.api.nvim_set_keymap('n', '<C-p>', ":lua require('fzf-lua').files()<CR>", {noremap = true})

-- nvim-tree and icons

require('nvim-web-devicons').setup {
  default = true;
}

vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", {noremap = true})
vim.cmd [[
  let g:nvim_tree_auto_open = 1
  let g:nvim_tree_auto_close = 1
  let g:nvim_tree_highlight_opened_files = 1
  let g:nvim_tree_tab_open = 1
  let g:nvim_tree_add_trailing = 1
  let g:nvim_tree_icons = { 'default': '' }
]]
