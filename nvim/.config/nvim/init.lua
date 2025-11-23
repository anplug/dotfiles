---- disable netrw and use nvim-tree instead
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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

vim.opt.hidden = false -- no hiden opened buffers
vim.opt.completeopt = { "menu" }

vim.wo.colorcolumn = '80,100,108'

require('packer').startup(function()
  use { 'wbthomason/packer.nvim' }

  use { 'rafi/awesome-vim-colorschemes' }
  use { 'matze/vim-move' }
  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-endwise' }

  use { 'vijaymarupudi/nvim-fzf' }
  use { 'ibhagwan/fzf-lua' }

  use { 'ntpeters/vim-better-whitespace' }
  use { 'editorconfig/editorconfig-vim' }

  use { 'slim-template/vim-slim' }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- LSP
  use { "neovim/nvim-lspconfig" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-buffer" }
  use { "hrsh7th/cmp-path" }
  use { "hrsh7th/cmp-cmdline" }
  use { "hrsh7th/nvim-cmp" }


  use { "williamboman/mason.nvim", config = true }
  use { "williamboman/mason-lspconfig.nvim" }

  -- use { "github/copilot.vim" }
  -- use {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   branch = "main",
  --   requires = "nvim-lua/plenary.nvim"
  -- }
end)

-- Autocomplete (nvim-cmp)
--
local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Tab>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

-- Set up lspconfig.


-- Laguage servers

require('mason').setup()
require('mason-lspconfig').setup {
  ensure_installed = { "rust_analyzer", 'clangd', 'lua_ls', 'solargraph' }
}

local nvim_lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- nvim_lsp.ruby_ls.setup{}
nvim_lsp.rust_analyzer.setup{}
nvim_lsp.clangd.setup{}
nvim_lsp.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim', 'use' }
      }
    }
  }
}
nvim_lsp.solargraph.setup{
  capabilities = capabilities
}

vim.api.nvim_set_keymap('n', '<C-i>', ':lua vim.diagnostic.open_float()<CR>', {silent = true})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>

    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-[]>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

vim.api.nvim_set_keymap('i', '<C-e>', "<C-x><C-o>", {noremap = true})


-- Colorschemes
-- Dark: one, afterglow, challenger_deep, dogrun, gotham
-- Light: flattened
vim.cmd [[colorscheme molokai]]

-- vim-move

vim.g.move_key_modifier = 'C'
vim.g.move_key_modifier_visualmode = 'S'

-- vim-better-whitespace

vim.g.better_whitespace_enabled = 1
vim.g.strip_whitespace_on_save = 1

-- https://github.com/ntpeters/vim-better-whitespace/issues/158
-- Turn off whitespaces handling for integrated Terminal
vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  group = vim.api.nvim_create_augroup('vimrc', { clear = true }),
  command = 'DisableWhitespace',
})

-- fzf

vim.api.nvim_set_keymap('n', '<C-p>',
  ":lua require('fzf-lua').files()<CR>", {noremap = true})
-- It's highly recommended to install Ripgrep otherwise standard Grep will kill your CPU
vim.api.nvim_set_keymap('n', '<C-s>', ':FzfLua grep<CR>', {})

-- nvim-tree and icons

require('nvim-tree').setup({
  renderer = {
    highlight_opened_files = 'all',
    icons = {
      glyphs = {
        default = '',
      },
    },
  },
  view = {
    width = 55,
  },
  git = {
    enable = true,
    ignore = false,
  };
})

require('nvim-web-devicons').setup {
  default = true;
}

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true, silent= true})

-- -- Copilot
--
-- vim.g.copilot_workspace_folders = { "~/pro" }
--
-- -- CopilotChat
--
-- require("CopilotChat").setup {
--   debug = true,
--   window = {
--     layout = 'vertical', -- 'vertical', 'horizontal', 'float', 'replace'
--     width = 80, -- fractional width of parent, or absolute width in columns when > 1
--     height = 0.3, -- fractional height of parent, or absolute height in rows when > 1
--   },
-- }
--
-- function CopilotChatReviewClear()
--   local ns = vim.api.nvim_create_namespace('copilot_review')
--   vim.diagnostic.reset(ns)
-- end
--
-- vim.api.nvim_create_user_command(
--   'CopilotChatReviewClear',
--   CopilotChatReviewClear,
--   {}
-- )
--
-- -- Keymaps
--
-- vim.api.nvim_set_keymap('n', 'tt',  ":CopilotChatToggle<CR>", {silent = true})
-- vim.api.nvim_set_keymap('n', 'tc',  ":CopilotChatReviewClear<CR>", {silent = true})
--
-- vim.api.nvim_set_keymap('n', 'tr',  ":'<,'>CopilotChatReview<CR>", {silent = true})
-- vim.api.nvim_set_keymap('n', 'te',  ":'<,'>CopilotChatExplain<CR>", {silent = true})
-- vim.api.nvim_set_keymap('n', 'twt', ":'<,'>CopilotChatTests<CR>", {silent = true})
-- vim.api.nvim_set_keymap('n', 'twf', ":'<,'>CopilotChatFix<CR>", {silent = true})
-- vim.api.nvim_set_keymap('n', 'two', ":'<,'>CopilotChatOptimize<CR>", {silent = true})
-- vim.api.nvim_set_keymap('n', 'twd', ":'<,'>CopilotChatDocs<CR>", {silent = true})
--
-- vim.api.nvim_set_keymap('v', 'tr',  ":'<,'>CopilotChatReview<CR>", {silent = true})
-- vim.api.nvim_set_keymap('v', 'te',  ":'<,'>CopilotChatExplain<CR>", {silent = true})
-- vim.api.nvim_set_keymap('v', 'twt', ":'<,'>CopilotChatTests<CR>", {silent = true})
-- vim.api.nvim_set_keymap('v', 'twf', ":'<,'>CopilotChatFix<CR>", {silent = true})
-- vim.api.nvim_set_keymap('v', 'two', ":'<,'>CopilotChatOptimize<CR>", {silent = true})
-- vim.api.nvim_set_keymap('v', 'twd', ":'<,'>CopilotChatDocs<CR>", {silent = true})
--
-- vim.api.nvim_set_keymap('i', '<S-Tab>', 'copilot#Accept("<Tab>")', { expr = true, silent = true })
