vim.o.number = true
vim.o.hlsearch = true
vim.o.ruler = true
vim.o.mouse = ''
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.cmdheight = 1
vim.o.updatetime = 500
vim.o.termguicolors = true
vim.o.swapfile = false

vim.wo.colorcolumn = '80,100,108'

require('packer').startup(function()
  use { 'wbthomason/packer.nvim' }

  use { 'rafi/awesome-vim-colorschemes' }
  use { 'matze/vim-move' }
  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-endwise' }
  use { 'vim-test/vim-test' }

  use { 'vijaymarupudi/nvim-fzf' }
  use { 'ibhagwan/fzf-lua' }

  use { 'ntpeters/vim-better-whitespace' }
  use { 'editorconfig/editorconfig-vim' }

  use { 'neovim/nvim-lspconfig' }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }
end)

-- Laguage servers

local nvim_lsp = require('lspconfig')

vim.api.nvim_set_keymap('n', '<C-i>',
  ':lua vim.lsp.diagnostic.show_line_diagnostics({focusable = false})<CR>',
  {silent = true}
)

nvim_lsp.solargraph.setup{}
nvim_lsp.rust_analyzer.setup{}
nvim_lsp.clangd.setup{}

-- Colorschemes
-- Dark: one, afterglow, challenger_deep, dogrun, gotham
-- Light: flattened
vim.cmd [[colorscheme molokai]]

-- vim-move

vim.cmd [[
  let g:move_key_modifier = 'C'
]]

-- vim-test

if vim.fn.has('nvim') then
  vim.cmd [[tmap <C-o> <C-\><C-n>]]
end

vim.api.nvim_set_keymap('n', 't<C-n>', ':TestNearest<CR>', {silent = true})
vim.api.nvim_set_keymap('n', 't<C-f>', ':TestFile<CR>', {silent = true})
vim.api.nvim_set_keymap('n', 't<C-a>', ':TestSuite<CR>', {silent = true})

vim.cmd [[
  let test#strategy = 'neovim'
]]

-- vim-better-whitespace

vim.cmd [[
  let g:better_whitespace_enabled=1
  let g:strip_whitespace_on_save=1
]]

-- fzf

vim.api.nvim_set_keymap('n', '<C-p>', ":lua require('fzf-lua').files()<CR>", {noremap = true})
-- It's highly recommended to install Ripgrep otherwise standard Grep will kill your CPU
vim.api.nvim_set_keymap('n', '<C-s>', ':FzfLua grep<CR>', {})

-- nvim-tree and icons

require('nvim-tree').setup {
  open_on_setup = false,
  open_on_tab = true,
  git = {
    enable = true,
    ignore = false,
  };
}

require('nvim-web-devicons').setup {
  default = true;
}

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true, silent= true})
vim.cmd [[
  let g:nvim_tree_highlight_opened_files = 1
  let g:nvim_tree_add_trailing = 1
  let g:nvim_tree_icons = { 'default': '' }
]]
